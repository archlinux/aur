# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Peter Nguyen <peter.hieu.nguyen@gmail.com>

pkgname=mongrel2
pkgver=1.9.2
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
source=("https://github.com/zedshaw/mongrel2/releases/download/$pkgver/$pkgname-v$pkgver.tar.bz2")

prepare() {
	cd "$srcdir/$pkgname-v$pkgver"

	# Allow to skip tests
	sed -r 's#^install: all#install: bin/mongrel2 m2sh procer#' -i Makefile
}

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	make bin/mongrel2 m2sh procer
}

check() {
	cd "$srcdir/$pkgname-v$pkgver"
	make tests
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make PREFIX="$pkgdir/usr" install;
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('543553c3082f2b992649a975f6cb7324ae2aea93af05288ea4f2c1262a7f63b2')
