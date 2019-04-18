# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=irrlamb-git
pkgver=r585
pkgrel=1
pkgdesc="3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/irrlamb"
license=('GPL3')
depends=('gcc-libs' 'freetype2' 'sqlite' 'lua' 'openal' 'libvorbis' 'libogg' 'libjpeg-turbo' 'libpng' 'zlib')
conflicts=('irrlamb')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/jazztickets/irrlamb")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git log --oneline | wc -l | sed 's/^/r/'
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
