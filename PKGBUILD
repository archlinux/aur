# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname=knightsgame
pkgver=027
pkgrel=1
pkgdesc="A free multiplayer competitive game involving knights, dungeons, and quests."
arch=('x86_64')
url="http://www.knightsgame.org.uk/"
license=('GPL2')
depends=('boost-libs' 'sdl2' 'curl' 'lua' 'fontconfig' 'enet')
makedepends=('boost')
source=(http://www.knightsgame.org.uk/files/knights_${pkgver}_src.tar.gz)
sha256sums=('b344315a56d20b7de537de8d9aea3207127629b4a94915187653e260b35f99fd')

build() {
	cd "$srcdir/knights_${pkgver}_src"

	# correct the lua++ package name
	sed 's/pkg-config lua-c++ --cflags/pkg-config lua++ --cflags/' -i Makefile
	sed 's/pkg-config lua-c++ --libs/pkg-config lua --libs/' -i Makefile

	prefix=/usr
	make \
		PREFIX="$prefix" \
		DOC_DIR="$prefix/share/doc/$pkgname" \
		DATA_DIR="$prefix/share/$pkgname"
}

package() {
	cd "$srcdir/knights_${pkgver}_src"
	prefix="$pkgdir/usr"
	make install \
		PREFIX="$prefix" \
		DOC_DIR="$prefix/share/doc/$pkgname" \
		DATA_DIR="$prefix/share/$pkgname"
}
