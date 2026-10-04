# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=openflap
pkgver=1.1.0
pkgbuild=r102
pkgfullname=(${pkgname}-${pkgver}${pkgbuild})
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://gitlab.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl3' 'sdl3_ttf' 'sdl3_mixer')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('28b14ea6d384508d42a572897bd5402ee0ee3985cc98b1e04652085fb8a454ce')

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
