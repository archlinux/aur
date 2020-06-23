# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=bkcrack-git
pkgver=r48.3f520e2
pkgrel=1
pkgdesc="Crack legacy zip encryption with Biham and Kocher's known plaintext attack."
arch=('x86_64')
url="https://github.com/kimci86/bkcrack"
license=('ZLIB')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'doxygen')
provides=("bkcrack")
conflicts=("bkcrack")
source=('bkcrack::git+https://github.com/kimci86/bkcrack')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bkcrack"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/bkcrack"
	cmake .
	make
}

package() {
	cd "$srcdir/bkcrack"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/bkcrack"
	mv "$pkgdir/usr/local" "$pkgdir/usr/share/bkcrack"
	mv "$pkgdir/usr/share/bkcrack/bkcrack" "$pkgdir/usr/bin/bkcrack"
	mv "$pkgdir/usr/share/bkcrack/license.txt" "$pkgdir/usr/share/licenses/bkcrack/license.txt"
}
