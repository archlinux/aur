# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (.desktop-file and icon): Nascher <kevin at nascher dot org>

pkgname=goatattack
pkgver=0.4.4
pkgrel=2
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2" "libpng" "sdl2_mixer")
makedepends=('gendesk')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
md5sums=('e6879f4adcf098905b2d453bc3f6fe00')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# generate .desktop-file
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Goat Attack" --exec "$pkgname" --categories "Game"

	autoreconf -i
	./configure --prefix=/usr --enable-map-editor
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir"

	cd "$pkgname-$pkgver"
	# install .desktop-file
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	make DESTDIR="$pkgdir/" install
}
