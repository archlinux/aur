# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=nss-mdns
pkgname=lib32-nss-mdns
pkgver=0.15.1
pkgrel=1
pkgdesc="glibc plugin providing host name resolution via mDNS"
arch=('x86_64')
url="https://github.com/lathiat/nss-mdns"
license=('LGPL')
depends=('lib32-glibc')
makedepends=('lib32-gcc-libs')
source=("https://github.com/lathiat/nss-mdns/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ddf71453d7a7cdc5921fe53ef387b24fd0c3c49f4dcf94a2a437498596761a21')

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd ${_pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libdir=/usr/lib32 \
        --disable-lynx
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
