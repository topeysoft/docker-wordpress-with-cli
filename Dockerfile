

# FROM mariadb:10.3.4 AS mysql

# ADD ./mysql /var/lib/mysql

# EXPOSE 3306


FROM wordpress:4.9.4-php7.0-apache AS wordpress


# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y sudo less

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp


# ADD ./wp-content /var/www/html/wp-content
# ADD ./mysql /var/lib/mysql

EXPOSE 80

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*