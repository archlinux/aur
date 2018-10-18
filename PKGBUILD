# Maintainer: Matej Postolka <matej@postolka.net>
pkgname=simlib
pkgver=3.06_20181003
pkgrel=1
pkgdesc="A simple SIMulation LIBrary for the C++ programming language"
arch=('x86_64')
url="http://www.fit.vutbr.cz/~peringer/SIMLIB/"
license=('GPL')
depends=('gcc-libs-multilib')
install="$pkgname.install"
source=("http://www.fit.vutbr.cz/~peringer/SIMLIB/source/$pkgname-${pkgver//_/-}.tar.gz"
	"$pkgname-$pkgver.patch")
sha256sums=("3624d870bca8303f14b3824dbe59db426bbc0e687586038710ef0edfcdc85012"
	    "84f1b11e4a4031885250d4254e4090fb7ad96f8cf9287d4221c2f8d8026d66b7")

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
