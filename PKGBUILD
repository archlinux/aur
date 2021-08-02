# Maintainer: ShyanJMC

pkgname=nginx-minimal
pkgver=1.21.1
pkgrel=1
arch=('any')
pkgdesc="Nginx with less features to be more minimal as never,just with SSL for security. Compiled with native support."
url="https://nginx.org"
license=('BSD3')
source=("git+https://github.com/nginx/nginx.git")
md5sums=('SKIP')
conflicts=('nginx')
provides=('nginx')


## There are many mandatory functions, build(){} is needed to build the package.


build() {
	cd nginx/
	git checkout tags/release-1.21.1
	# Just enabled threads,ssl and proxy because are core functions. Use as non-privileged users and group; http
	./auto/configure --user=http --group=http --build=nginx_minimal --with-threads --with-http_ssl_module --with-http_v2_module --without-http_charset_module --without-http_gzip_module --without-http_ssi_module --without-http_userid_module --without-http_access_module --without-http_auth_basic_module --without-http_mirror_module --without-http_autoindex_module --without-http_geo_module --without-http_map_module --without-http_split_clients_module --without-http_referer_module --without-http_rewrite_module --without-http_fastcgi_module --without-http_uwsgi_module --without-http_scgi_module --without-http_grpc_module --without-http_memcached_module --without-http_limit_conn_module --without-http_limit_req_module --without-http_empty_gif_module --without-http_browser_module --without-http_upstream_hash_module --without-http_upstream_ip_hash_module --without-http_upstream_least_conn_module --without-http_upstream_random_module --without-http_upstream_random_module --without-http_upstream_keepalive_module --without-http_upstream_zone_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --without-stream_limit_conn_module --without-stream_access_module --without-stream_geo_module --without-stream_map_module --without-stream_split_clients_module --without-stream_return_module --without-stream_set_module --without-stream_upstream_hash_module --without-stream_upstream_least_conn_module --without-stream_upstream_random_module --without-stream_upstream_zone_module 
	make
}

## Package function will produce the respectives files and folders to allow pacman to create the new it.
## The "make DESTDIR="$pkgdir/" install" call will install files into the fakeroot environment so pacman will alow track them.

package() {
	cd nginx/
	make DESTDIR="$pkgdir/" install
}


