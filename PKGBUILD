# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=nss-mdns
pkgname=lib32-nss-mdns
pkgver=0.14.1
pkgrel=1
pkgdesc="glibc plugin providing host name resolution via mDNS"
arch=('x86_64')
url="http://0pointer.de/lennart/projects/nss-mdns/"
license=('LGPL')
depends=('lib32-glibc')
makedepends=('lib32-gcc-libs')
source=("https://github.com/lathiat/nss-mdns/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a2094101b735cade45048764ea594bdae2bfa9399837f3c852a5b264416e9c8c')

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
