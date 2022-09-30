# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=openflap
pkgver=1.0.4
pkgbuild=r66
pkgfullname=(${pkgname}-${pkgver}${pkgbuild})
pkgrel=2
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://gitlab.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('daf017025e0edcf4f8fac8d5d4a7d43f6b68e207333e667f6242de6de1e75b3f')

prepare() {
	cd "$srcdir/$pkgfullname"
	sed -i 's/add_dependencies(${CMAKE_PROJECT_NAME} version)//' CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgfullname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}
