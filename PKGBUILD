# Archimedes

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=archimedes
pkgver=2.0.0
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
sha256sums=('SKIP' 'SKIP')

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

