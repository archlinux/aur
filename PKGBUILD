# Maintainer: Denilson Sá <denilsonsa@gmail.com>

# TODO: Create and install a .desktop entry.
# TODO: Add means to let the user provide their own cc-lynx.dac and cc-ms.dac.

pkgname=tworld
pkgver=1.3.2
pkgrel=1
pkgdesc="Tile World is an emulation of the game Chip's Challenge. This package includes three fan-made level packs (CCLP1, CCLP2, and CCLP3)."
arch=('x86_64')
url="https://www.muppetlabs.com/~breadbox/software/tworld/"
license=('GPL2')
depends=('sdl')
source=(
	"http://www.muppetlabs.com/~breadbox/pub/software/tworld/$pkgname-$pkgver-CCLPs.tar.gz"
	"makefile-destdir-1.3.2.patch"
)
sha512sums=(
	"395b1ddbe9df568243d2e8b78704732dbbe931a5b2ea2af63ebc4e93394c5715e58891a3e1f536f785062cb44ba4540538544b3ed10910d9f30843452a26b803"
	"a506370349088199866061fd14824f7eb8efe7ba24d1d4fcc1606b5b5fed5e3b2121195e0faa40d7f434b9d92810fdd517ac0e3862c3ad7317f02be6d9a6e0ed"
)

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/makefile-destdir-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -p docs/tworld.html "$pkgdir/usr/share/doc/$pkgname"
	cp -pr CCLPs/* "$pkgdir/usr/share/doc/$pkgname"
}
