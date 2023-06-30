## This docker file needs the context to be parent root.

ARG EXPOSE_PORT_SERVICE=8080

FROM nginxinc/nginx-unprivileged:1.25

# Remove default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Any configuration in nginx/ are mounted to the correct location
COPY ./*.conf.template /etc/nginx/templates/

ARG EXPOSE_PORT_SERVICE
ENV EXPOSE_PORT_SERVICE=${EXPOSE_PORT_SERVICE}
EXPOSE ${EXPOSE_PORT_SERVICE}
ENV HTTP_PATH="/files"
COPY /docs/** /usr/share/nginx/files/
COPY /docs/** /usr/share/nginx/



