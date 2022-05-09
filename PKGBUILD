# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=openflap
pkgver=1.0.2r52
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
changelog=Changelog
source=("https://github.com/jazztickets/openflap/releases/download/1.0.2/openflap-${pkgver}-src.tar.gz")
sha256sums=('a5296816a5c80600a201b61d7e1e83599d5b0ac414540fabd7e36309439ebcf1')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/add_dependencies(${CMAKE_PROJECT_NAME} version)//' CMakeLists.txt
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
