# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria
pkgver=1.0.0_rc1
pkgbuild=a3a4a69f
pkgfullname=(${pkgname}-${pkgver//_/-}-${pkgbuild})
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/${pkgver//_/-}/${pkgfullname}-src.tar.gz")
sha256sums=('9e64eaa0fe8a185b5cbb9cfcc3acc88561407239cab55d0c3ec9ca1b4f376ff2')

prepare() {
	cd $srcdir/$pkgfullname
	sed -i 's/add_dependencies(${CMAKE_PROJECT_NAME} version)//' CMakeLists.txt
}

build() {
	cd $srcdir/$pkgfullname
	cmake -DDISABLE_EDITOR=1 -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
