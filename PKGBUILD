# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=serialdv-git
pkgver=r13.7eda296
pkgrel=1
pkgdesc="C++ Minimal interface to encode and decode audio with AMBE3000 based devices in packet mode over a serial link"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/serialDV"
license=('GPL3')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/serialDV.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/serialDV"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/serialDV"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
	cd "$srcdir/serialDV"
	make DESTDIR="$pkgdir/" install
}
