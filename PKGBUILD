# Maintainer: Leo <i@setuid0.dev>

_extname=ast
pkgname=php-$_extname
pkgver=1.1.3
pkgrel=1
pkgdesc='Extension exposing PHP 7 abstract syntax tree'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('BSD')
depends=('php>=7.1')
source=("$pkgname-$pkgver.tar.gz::http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('528b54aabcfce6bf0e94b5940a73cca357d4a52fad9fef4cd4dc025abc1a9fbd')

prepare() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure --prefix=/usr --with-ast
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

