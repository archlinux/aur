# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Peter Nguyen <peter.hieu.nguyen@gmail.com>

pkgname=mongrel2
pkgver=1.9.1
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
source=("https://github.com/zedshaw/mongrel2/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")

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

sha256sums=('dc491c9b06f1b32020fd977737fa16f99af6d99e7bfb2f80fcc53278dd44f398')
