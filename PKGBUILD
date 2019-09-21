# Author: VisaJE <eemil dot visakorpi at gmail dot com>
pkgname=doomsday-tetris-2-git
pkgver=1.1.r2.g5b77c2f
pkgrel=1
pkgdesc="A Tetris copy with randomly generated blocks. Made with C++."
arch=("x86_64")
license=('MIT')
depends=('sdl2' 'sdl2_ttf' 'fontconfig' 'rapidjson' 'postgresql-libs')
makedepends=('git' 'automake' 'libtool')
provides=('doomsday-tetris-2')
conflicts=('doomsday-tetris-2')
_commit=5b77c2f6f0bbfb754165ad78bc7f3d3f6ff84fd4
source=("git+git://github.com/VisaJE/doomsday-tetris-2#commit=$_commit")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}


package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

