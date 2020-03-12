# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.6.22
pkgrel=8
pkgdesc="Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS (with Admin plugin)"
arch=("any")
url="https://getgrav.org"
license=("MIT")
depends=('php>=7.1.3' 'php-gd' 'php-fpm')
optdepends=('php-apcu: A userland caching module for PHP' 
			'xdebug: PHP debugging extension' 
			'apache: A high performance Unix-based HTTP server' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=post_install
source=("https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip"
		'post_install')
sha256sums=('0ce1f1b5cb976fc475c3d5fffa33a4f4c882bd431dfc0fb524e59329e88dd148'
			'96ae16816f0032c12d45e7fa912ec275e8ca6735aef6e0d7e7fe5e30d36181ab')

package() {
    cd "${pkgdir}"
    install -dm0755 usr/share/webapps/${pkgname}
    mv ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/
    cd ${pkgdir}/usr/share/webapps/${pkgname}
    chgrp -R http .
	find . -type f | xargs chmod 664
	find ./bin -type f | xargs chmod 775
	find . -type d | xargs chmod 775
	find . -type d | xargs chmod +s
	umask 0002
    rm -Rf *.md composer.json composer.lock
}
