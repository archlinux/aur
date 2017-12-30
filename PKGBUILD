# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=nss-mdns
pkgname=lib32-${_pkgname}
pkgver=0.10
pkgrel=5
pkgdesc="glibc plugin providing host name resolution via mDNS"
arch=('x86_64')
url="http://0pointer.de/lennart/projects/nss-mdns/"
license=('LGPL')
depends=('lib32-glibc')
makedepends=('lib32-gcc-libs')
source=("http://pkgs.fedoraproject.org/repo/pkgs/${_pkgname}/${_pkgname}-${pkgver}.tar.gz/03938f17646efbb50aa70ba5f99f51d7/${_pkgname}-${pkgver}.tar.gz")
md5sums=('03938f17646efbb50aa70ba5f99f51d7')

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
