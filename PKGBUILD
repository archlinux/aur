# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-pdo_sqlsrv
pkgver=4.1.8
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/pdo_sqlsrv"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://pecl.php.net/get/pdo_sqlsrv-${pkgver}preview.tgz")
sha256sums=('f2fe70bc17de9207fb0ee232e830243c994ad64e625e90740dcbf68694f6cd27')
backup=('etc/php/conf.d/pdo_sqlsrv.ini')

build() {
	cd "$srcdir"/pdo_sqlsrv-${pkgver}preview
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/pdo_sqlsrv-${pkgver}preview
	make INSTALL_ROOT="$pkgdir" install

	cd "$pkgdir"
	install -dm0755 etc/php/conf.d/
	echo -e "extension=pdo_sqlsrv.so" > etc/php/conf.d/pdo_sqlsrv.ini

	install -Dm0644 "$srcdir"/pdo_sqlsrv-${pkgver}preview/LICENSE usr/share/licenses/$pkgname/LICENSE
}
