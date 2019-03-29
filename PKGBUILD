# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdca
pkgname=lib32-libdca
pkgver=0.0.6
pkgrel=2
pkgdesc="Free library for decoding DTS Coherent Acoustics streams (32 bit)"
arch=(x86_64)
license=(GPL)
url="http://www.videolan.org/developers/libdca.html"
depends=(lib32-glibc libdca)
options=('!emptydirs')
source=("https://download.videolan.org/pub/videolan/${_basename}/${pkgver}/${_basename}-${pkgver}.tar.bz2")
sha512sums=('d264128019e7fd295a35691636311f81960c17802dbbc67764c4e00b2fdf12ebc69b057a4947b57551a130e5cfd1fef3fe3558c7067216ea04a0b6bbb881b4f1')

build() {
    cd ${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-static

    make
}

package() {
    cd ${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
    rm "${pkgdir}/usr/lib32/libdts.a"
}
