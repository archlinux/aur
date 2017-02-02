# Maintainer: Marcel Röthke <marce.roethke@haw-hamburg.de>

pkgname=rtrlib-git
pkgver=r556.1caa14e
pkgrel=1
pkgdesc="RPKI-RTR client library"
arch=(x86_64 i686)
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=(libssh)
makedepends=(cmake)
conflicts=(rtrlib)
options=()
source=("git+https://github.com/rtrlib/rtrlib.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/${pkgname%-git}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname%-git}
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR:STRING=lib \
          .
    make rtrlib
}

package() {
    cd ${srcdir}/${pkgname%-git}
    make DESTDIR="${pkgdir}" install
}
