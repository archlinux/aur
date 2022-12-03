# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=openflap
pkgver=1.0.6
pkgbuild=r76
pkgfullname=(${pkgname}-${pkgver}${pkgbuild})
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://gitlab.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('de41910d764659bac967316a93af7ac0d411fd645f181c21e3b405b8b5a554a8')

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
