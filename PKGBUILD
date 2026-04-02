# Maintainer: Leo <i@hardrain980.com>

_extname=var_representation
pkgname=php-$_extname
pkgver=0.1.5
pkgrel=1
pkgdesc='A compact, more readable alternative to var_export'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('BSD-3-Clause')
depends=('php>=7.2')
source=("$pkgname-$pkgver.tar.gz::http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('a43352b65a20a01c455fb3327fa99c4a03a9ca90fa92e937d8ad1b9e364dae41')

prepare() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure --prefix=/usr
}

build() {
	cd "$srcdir/$_extname-$pkgver"
	make
}

check() {
	cd "$srcdir/$_extname-$pkgver"
	NO_INTERACTION=1 make test
}

package() {
	cd $srcdir/$_extname-$pkgver
	make INSTALL_ROOT=$pkgdir install
	echo "extension=$_extname" | install -Dm644 /dev/stdin "$pkgdir/etc/php/conf.d/$_extname.ini"
}
