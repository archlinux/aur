# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=openflap
pkgver=1.0.3
pkgbuild=r62
pkgfullname=(${pkgname}-${pkgver}${pkgbuild})
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
source=("https://github.com/jazztickets/openflap/releases/download/${pkgver}/${pkgfullname}-src.tar.gz")
sha256sums=('afa9f27a11c26835ac2602512eb86473b00e198a993be1334aef8fe4fbd11569')

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
