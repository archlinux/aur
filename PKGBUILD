# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=emptyclip
pkgver=2.0.1
pkgbuild=8955a4d
pkgfullname=(${pkgname}-${pkgver}-${pkgbuild})
pkgrel=1
pkgdesc="A top-down shooter action RPG"
arch=('i686' 'x86_64')
url="https://empty-clip.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('9cd00179baac611a3f0f028de69a4edc8683f8ffc1af21d85823759e3f2b06c3')

prepare() {
	cd $srcdir/$pkgfullname
	sed -i 's/add_dependencies(${CMAKE_PROJECT_NAME} version)//' CMakeLists.txt
}

build() {
	cd $srcdir/$pkgfullname
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
