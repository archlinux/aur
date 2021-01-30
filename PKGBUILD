# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-sqlsrv
_extname=${pkgname#php-}
pkgver=5.9.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="Microsoft SQL Server Drivers for PHP."
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/$_extname"
license=('MIT')
depends=('php' 'msodbcsql')
source=("https://pecl.php.net/get/$_extname-${_pkgver}.tgz")
sha256sums=('0a108e0408e8b984e5ae8bc52824ed32872d72e3a571cd2a5d2b63b200215ab3')
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
