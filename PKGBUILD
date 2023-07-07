# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=emptyclip
pkgver=2.0.2
pkgbuild=adc6abf
pkgfullname=(${pkgname}-${pkgver}-${pkgbuild})
pkgrel=1
pkgdesc="A top-down shooter action RPG"
arch=('i686' 'x86_64')
url="https://empty-clip.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('9f349fefb32a63dcc354f3d753df99e9224e44c9f777f880be677ce6cda27f18')

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
