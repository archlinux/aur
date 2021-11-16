# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Thor77 <thor77 at thor77 dot org>
# Contributor (.desktop-file and icon): Nascher <kevin at nascher dot org>

pkgname=goatattack
pkgver=0.4.5
pkgrel=4
pkgdesc='A fast-paced multiplayer pixel art shooter game.'
arch=('i686' 'x86_64')
url='http://www.goatattack.net/'
license=('GPL')
depends=('sdl2' 'libpng' 'sdl2_mixer' 'freetype2')
makedepends=('gendesk' 'git')
source=("git+https://github.com/$pkgname/$pkgname.git#commit=7a84df362cf20551540eb0ddfb675951104a5720")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	# generate .desktop-file
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'Goat Attack' --exec "$pkgname" --categories 'Game;ActionGame'

	autoupdate -f
	autoreconf -if
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr --enable-map-editor
	make
}

check() {
	cd "$srcdir/$pkgname"
	make check
}

package() {
	cd "$srcdir/$pkgname"
	# install .desktop-file
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	make DESTDIR="$pkgdir/" install
}
