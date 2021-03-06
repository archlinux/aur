# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria-git
pkgver=d64051a2
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
conflicts=('choria')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/jazztickets/choria#branch=new")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git rev-parse --short HEAD
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
