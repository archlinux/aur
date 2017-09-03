# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=txr
pkgver=185
pkgrel=1
pkgdesc="A data munging language."
arch=('i686' 'x86_64')
url="http://nongnu.org/txr/"
license=('BSD')
depends=('libffi')
makedepends=()
source=("http://www.kylheku.com/cgit/txr/snapshot/txr-${pkgver}.tar.bz2")
sha256sums=('a075372a1ac6e62cf30482aa5f483ac4a40534d4a855a4c08ed59c3b7589ce26')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	# Tests have to run sequentially.
	make -j1 tests.clean tests
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# txr installs licenses to /usr/share/txr. Add symlinks from Arch's
	# usual license directory.
	mkdir -p "$pkgdir/usr/share/licenses/txr"
	ln -s -t "$pkgdir/usr/share/licenses/txr" ../../txr/LICENSE ../../txr/METALICENSE
}
