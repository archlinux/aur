# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria
pkgver=1.0.2
pkgbuild=4a83c4cd
pkgfullname=(${pkgname}-${pkgver}-${pkgbuild})
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://choria.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgname}-${pkgver}-${pkgbuild}-src.tar.gz")
sha256sums=('ff782dab7b1ea87482e7b04a8accb8c293215701f1d94a305b709188edbc1660')

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
