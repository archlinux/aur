# Author: VisaJE <eemil.visakorpi at gmail>
pkgname=doomsday-tetris-2-git
pkgver=1.3.r3.g540d02c
pkgrel=1
pkgdesc="A Tetris copy with randomly generated blocks. Made with C++."
arch=("x86_64")
license=('MIT')
depends=('sdl2' 'sdl2_ttf' 'fontconfig' 'rapidjson' 'postgresql-libs')
makedepends=('git' 'automake' 'autoconf' 'libtool')
provides=('doomsday-tetris-2')
conflicts=('doomsday-tetris-2')
_commit=540d02c35bc3e331b0f990d146f1e1803fa0a204
source=("git+https://github.com/VisaJE/doomsday-tetris-2#commit=$_commit")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
	cd "${pkgname%-git}"
    cmake -DCMAKE_BUILD_TYPE=Release .
    cmake --build . -j
}


package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

