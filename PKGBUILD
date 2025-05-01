# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=choria
pkgver=1.1.0
pkgbuild=b3de0f4a
pkgfullname=${pkgname}-${pkgver}-${pkgbuild}
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://choria.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgname}-${pkgver}-${pkgbuild}-src.tar.gz")
sha256sums=('ec8032247d6c21ec0f9aca74c662f6faaa1683bd41ff9415c66abcf1ef1fa2cc')

prepare() {
	cd $srcdir/$pkgfullname
	sed -i 's/add_dependencies(\${CMAKE_PROJECT_NAME} version)//' CMakeLists.txt
	sed -i 's/add_custom_target(version DEPENDS dummy)//' CMakeLists.txt
	sed -i 's/\${PROJECT_SOURCE_DIR}\/src\/version.cpp//' CMakeLists.txt
	sed -i 's/\${PROJECT_SOURCE_DIR}\/src\/version.h//' CMakeLists.txt
}

build() {
	cd $srcdir/$pkgfullname
	cmake -DCMAKE_CXX_FLAGS="-DNDEBUG" -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
