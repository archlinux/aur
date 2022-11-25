# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=emptyclip-git
pkgver=3f0f300
pkgrel=1
pkgdesc="A top-down shooter RPG"
arch=('i686' 'x86_64')
url="https://empty-clip.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
conflicts=('emptyclip')
makedepends=('cmake')
source=("${pkgname}::git+https://gitlab.com/empty-clip/code.git#branch=dev")
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
