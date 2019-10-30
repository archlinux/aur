# Author: VisaJE <eemil.visakorpi at gmail>
pkgname=doomsday-tetris-2-git
pkgver=1.1.r5.g1fbf92e
pkgrel=1
pkgdesc="A Tetris copy with randomly generated blocks. Made with C++."
arch=("x86_64")
license=('MIT')
depends=('sdl2' 'sdl2_ttf' 'fontconfig' 'rapidjson' 'postgresql-libs')
makedepends=('git' 'automake' 'autoconf' 'libtool')
provides=('doomsday-tetris-2')
conflicts=('doomsday-tetris-2')
_commit=1fbf92e74ec2eedab1e90f3fb5a98b8bc49481ad
source=("git+git://github.com/VisaJE/doomsday-tetris-2#commit=$_commit")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
	cd "${pkgname%-git}"
    ./autogen.sh
	./configure --prefix=/usr
	make
}


package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

