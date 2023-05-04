# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

_basename=a52dec
pkgname=lib32-a52dec
pkgver=0.8.0
pkgrel=1
pkgdesc="A free library for decoding ATSC A/52 streams (32-bit)"
url="https://git.adelielinux.org/community/a52dec/"
arch=('x86_64')
license=('GPL2')
depends=('lib32-glibc' a52dec)
source=(https://distfiles.adelielinux.org/source/$_basename/$_basename-$pkgver.tar.gz)
sha256sums=('03c181ce9c3fe0d2f5130de18dab9bd8bc63c354071515aa56983c74a9cffcc9')

build() {
     cd ${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-shared

    make
}

package() {
    cd ${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/{include,bin,share}
}
