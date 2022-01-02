# Maintainer: Matej Postolka <matej@postolka.net>
pkgname=simlib
pkgver=3.08_20211004
pkgrel=1
pkgdesc="A simple SIMulation LIBrary for the C++ programming language"
arch=('x86_64')
url="http://www.fit.vutbr.cz/~peringer/SIMLIB/"
license=('GPL')
depends=('gcc-libs-multilib')
install="$pkgname.install"
source=("http://www.fit.vutbr.cz/~peringer/SIMLIB/source/$pkgname-${pkgver//_/-}.tar.gz"
	"$pkgname-$pkgver.patch")
sha256sums=("82dc2c232b19e4b40185d72726f61a17c444b77ae983c139606c2e9127892932"
	    "3b3033fe357eb5676e54084e158dd948b07d4a961b281e74503dd9b181b91ac0")

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
