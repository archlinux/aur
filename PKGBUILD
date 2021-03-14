# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria
pkgver=1.0.0_rc2
pkgbuild=a9b14f93
pkgfullname=(${pkgname}-${pkgver//_/-}-${pkgbuild})
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/${pkgver//_/-}/${pkgfullname}-src.tar.gz")
sha256sums=('a8f6c2f95b7cf5d9505d49478b4de6f3a64656d6be578dfdc98824816edca46c')

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
