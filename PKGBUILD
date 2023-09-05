# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=choria-git
pkgver=e55de87f
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores"
arch=('i686' 'x86_64')
url="https://choria.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'sqlite' 'zlib')
conflicts=('choria')
makedepends=('cmake')
source=("${pkgname}::git+https://gitlab.com/choria/code.git#branch=dev")
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
