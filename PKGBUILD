# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
pkgver=4.1.8
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/sqlsrv"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://pecl.php.net/get/sqlsrv-${pkgver}preview.tgz")
sha256sums=('7ac43c4069307ac1e43dc6211be8e1f8f58621565a0a628cc3e0422de1eca39a')
backup=('etc/php/conf.d/sqlsrv.ini')

build() {
	cd "$srcdir"/sqlsrv-${pkgver}preview
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/sqlsrv-${pkgver}preview
	make INSTALL_ROOT="$pkgdir" install

	cd "$pkgdir"
	install -dm0755 etc/php/conf.d/
	echo -e "extension=sqlsrv.so" > etc/php/conf.d/sqlsrv.ini

	install -Dm0644 "$srcdir"/sqlsrv-${pkgver}preview/LICENSE usr/share/licenses/$pkgname/LICENSE
}
