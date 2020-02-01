# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
_extname=${pkgname#php-}
pkgver=5.8.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Microsoft PDO Drivers for PHP for SQL Server"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/$_extname"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://pecl.php.net/get/$_extname-${_pkgver}.tgz")
sha256sums=('dccadca621d14d98e3f0a2f31304f4c01396fce3af69b0528a19121e669e64cf')
backup=("etc/php/conf.d/$_extname.ini")

build() {
	cd "$srcdir"/$_extname-$_pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$_extname-$_pkgver
	make INSTALL_ROOT="$pkgdir" install

	cd "$pkgdir"
	install -dm0755 etc/php/conf.d/
	echo -e "extension=$_extname.so" > etc/php/conf.d/$_extname.ini

	install -Dm0644 "$srcdir"/$_extname-$_pkgver/LICENSE usr/share/licenses/$pkgname/LICENSE
}
