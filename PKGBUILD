# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Thor77 <thor77 at thor77 dot org>
# Contributor (.desktop-file and icon): Nascher <kevin at nascher dot org>

pkgname=goatattack
pkgver=0.5.0
pkgrel=2
pkgdesc='A fast-paced multiplayer pixel art shooter game.'
arch=('i686' 'x86_64')
url='http://www.goatattack.net/'
license=('GPL-3.0-or-later')
depends=('sdl2' 'libpng' 'sdl2_mixer' 'freetype2')
makedepends=('git')
_commit='9c4a94bf62cce720180c9ed60ee6aa1d4c10a376'
source=("git+https://github.com/$pkgname/$pkgname.git#commit=${_commit}")
sha256sums=('5456f581461df78d28bbdc11cab94ad28e1bbe28cb357bfc911b3bf01433de3b')

prepare() {
	cd "$srcdir/$pkgname"

	autoupdate -f
	autoreconf -if
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr --enable-map-editor --enable-non-free-pak --enable-master-server
	make
}

check() {
	cd "$srcdir/$pkgname"
	make check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
