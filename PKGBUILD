# Maintainer: Matej Postolka <matej@postolka.net>
pkgname=simlib
pkgver=3.04_20171004
pkgrel=2
pkgdesc="A simple SIMulation LIBrary for the C++ programming language"
arch=('x86_64')
url="http://www.fit.vutbr.cz/~peringer/SIMLIB/"
license=('GPL')
depends=('gcc-libs-multilib')
install="$pkgname.install"
source=("http://www.fit.vutbr.cz/~peringer/SIMLIB/source/$pkgname-${pkgver//_/-}.tar.gz"
		"$pkgname-$pkgver.patch")
sha256sums=("d169941776b41ef3e12a4f4fc9f0c2ed1352b184c272f953e3930704ceb1d886"
			"9483273c0c620541f3df9f21b028ade08fe2d64dd00ec67c7bc2615238c4fc93")

prepare() {
	cd "$pkgname"
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make -k test
}

package() {
	cd "$pkgname/src"
	make PREFIX="$pkgdir/usr" install
}
