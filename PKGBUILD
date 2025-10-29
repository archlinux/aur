# Maintainer: Ryan Rhee <ryanrhee@icloud.com>
pkgname=ltris2
pkgver=2.0.4
pkgrel=1
pkgdesc="A tetris clone with many features"
arch=('x86_64')
url="https://lgames.sourceforge.io/LTris/"
license=('GPL-3.0-or-later')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
backup=('var/games/ltris2.hscr')
source=("https://sourceforge.net/projects/lgames/files/ltris/$pkgname-$pkgver.tar.gz")
sha256sums=('482150495f9d87bb139d5af1abec7030383c37fdb3e75a45e9bad67ead798eda')

prepare() {
	cd "$pkgname-$pkgver"

	# no -Wno-format to please -Wformat-security
	sed -e 's/-Wno-format//' -i configure
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --localstatedir=/var/games
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# avoid pacman warning (var/games is 755 by default)
	chmod 775 "$pkgdir/var/games"
}
