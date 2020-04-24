# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.6.22
pkgrel=8
pkgdesc="Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS (with Admin plugin)"
arch=("any")
url="https://getgrav.org"
license=("MIT")
provides=('grav')
depends=('php>=7.1.3' 'php-gd' 'php-fpm')
optdepends=('php-apcu: A userland caching module for PHP' 
			'xdebug: PHP debugging extension' 
			'apache: A high performance Unix-based HTTP server' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=grav.install
source=("https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=('0ce1f1b5cb976fc475c3d5fffa33a4f4c882bd431dfc0fb524e59329e88dd148')

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
