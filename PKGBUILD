# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria
pkgver=1.0.0
pkgbuild=8f1ba36c
pkgfullname=(${pkgname}-${pkgver//_/-}-${pkgbuild})
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/${pkgver//_/-}/${pkgfullname}-src.tar.gz")
sha256sums=('b685a7e9222531afd973dc7e56b972dad35119a204b88fa45104a8ef1d905a0c')

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
