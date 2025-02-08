# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=emptyclip
pkgver=2.0.3
pkgbuild=0d97724f
pkgfullname=(${pkgname}-${pkgver}-${pkgbuild})
pkgrel=1
pkgdesc="A top-down shooter action RPG"
arch=('i686' 'x86_64')
url="https://empty-clip.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('b3253fc11f8a03fa4aa4eab519eedc8fff3d79170e1d0f86d507ad2ded1ea165')

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
