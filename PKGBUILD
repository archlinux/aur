# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Peter Nguyen <peter.hieu.nguyen@gmail.com>

pkgname=mongrel2
pkgver=1.9.0
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
source=("https://github.com/zedshaw/mongrel2/releases/download/v1.9.0/$pkgname-v$pkgver.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-v$pkgver"

	# Allow to skip tests
	sed -r 's#^install: all#install: bin/mongrel2 m2sh procer#' -i Makefile

	# Disable known broken test (see #205)
	sed 's#ret =x509_crt_verify#//ret =x509_crt_verify#' -i tests/cert_tests.c
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
}

sha256sums=('7a18abba633a105eff29e135acf6e07b25bdababec1ed37d9463d0ae4718e2b4')
