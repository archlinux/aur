# Maintainer: Alan Witkowski <alan dot witkowski at gmail dot com>
pkgname=openflap
pkgver=1.0.0
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
changelog=Changelog
source=("https://github.com/jazztickets/openflap/archive/$pkgver.tar.gz")
sha256sums=('d8be341b7287892517a54e1a1d6155388c8d0da5695037aab4894b27ae68392d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}
