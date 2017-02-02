# Maintainer: Marcel Röthke <marce.roethke@haw-hamburg.de>

pkgname=rtrlib
pkgver=0.3.6
pkgrel=2
pkgdesc="RPKI-RTR client library"
arch=(x86_64 i686)
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=(libssh)
makedepends=(cmake)
options=(strip)
source=("rtrlib-$pkgver.tar.gz::https://github.com/rtrlib/rtrlib/archive/v$pkgver.tar.gz")
md5sums=(07912a1612b1e949f16e0f1c6474392c)

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
