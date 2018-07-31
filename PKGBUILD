# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-pdo_sqlsrv
_extname=${pkgname#php-}
pkgver=5.3.0
pkgrel=1
pkgdesc="Microsoft Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/$_extname"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('aac5f5e90c3b5c452d1ced17e2bd89c4bcdc105cebcbfd8a90ea8564e909ce2d')
backup=("etc/php/conf.d/$_extname.ini")

build() {
	cd "$srcdir"/$_extname-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$_extname-$pkgver
	make INSTALL_ROOT="$pkgdir" install

	cd "$pkgdir"
	install -dm0755 etc/php/conf.d/
	echo -e "extension=$_extname.so" > etc/php/conf.d/$_extname.ini

	install -Dm0644 "$srcdir"/$_extname-$pkgver/LICENSE usr/share/licenses/$pkgname/LICENSE
}
