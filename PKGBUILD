# Archimedes

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=archimedes
pkgver=2.0.1
pkgrel=1
pkgdesc='Semiconductor device simulations.'
arch=('x86_64')
url="https://www.gnu.org/software/$pkgname/"
license=('GPL3')
depends=()
makedepends=()
provides=('archimedes')
source=(
	"http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
	'inline-fix.diff'
)
sha256sums=(
	'7facfaa198bd4391445101138d3659a5d6fb74d989f0b83aebbc687b47b3d749'
	'e2f0c36d0e732979e4643c44f66dd72e07cba14d007acb988c811f3a5cbd3574'
)

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/inline-fix.diff"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

