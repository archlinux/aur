# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=bkcrack-git
pkgver=r38.50ab495
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

	install -D "$pkgdir/usr/local/bkcrack" "$pkgdir/usr/bin/bkcrack"
	install -d "$pkgdir/usr/share/doc/bkcrack-git/html"
	install -D $pkgdir/usr/local/doc/html/* "$pkgdir/usr/share/doc/bkcrack-git/html"
	install -D "$pkgdir/usr/local/license.txt" "$pkgdir/usr/share/licenses/bkcrack-git/license.txt"

	rm -rdf "$pkgdir/usr/local"
}
