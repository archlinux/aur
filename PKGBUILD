# Maintainer: Jason Gardner <buhrietoe@gmail.com>
# Contributer: Jason Gardner <buhrietoe@gmail.com>

pkgname=j2534-git
pkgver=r9.5ffb718
pkgrel=1
pkgdesc="j2534 driver for linux"
arch=("any")
url="https://github.com/NikolaKozina/j2534"
license=("unknown")
depends=("libusb")
makedepends=("git") # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+https://github.com/NikolaKozina/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p $pkgdir/usr/lib/pkgconfig $pkgdir/usr/include
    cp j2534.h $pkgdir/usr/include/
    cp j2534.pc $pkgdir/usr/lib/pkgconfig/
    cp j2534.so $pkgdir/usr/lib/
}
