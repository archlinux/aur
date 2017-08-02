# Maintainer: Marcel Röthke <marce.roethke@haw-hamburg.de>

pkgname=rtrlib
pkgver=0.4.0
pkgrel=1
pkgdesc="RPKI-RTR client library"
arch=(x86_64 i686)
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=(libssh)
makedepends=(cmake)
options=(strip)
source=("rtrlib-$pkgver.tar.gz::https://github.com/rtrlib/rtrlib/archive/v$pkgver.tar.gz")
md5sums=(59e3c6c0f9878bf6148d3275eb073e0e)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR:STRING=lib \
          .

    make rtrlib
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
