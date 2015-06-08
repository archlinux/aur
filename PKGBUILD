# Maintainer: Alan Witkowski <alan dot witkowski at gmail dot com>
pkgname=openflap
pkgver=1.0
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
changelog=Changelog
source=("https://github.com/jazztickets/openflap/archive/$pkgver.tar.gz")
sha256sums=('aca8ed0fe0e8229ee26344e01bb4b7a69877bf4cfe96bab991770f5048ab0ff9')

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
