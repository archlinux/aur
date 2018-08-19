# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=openexr
pkgname=lib32-openexr
pkgver=2.2.1
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="http://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-ilmbase' 'lib32-zlib' 'openexr')
source=("http://download.savannah.nongnu.org/releases/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('8f9a5af6131583404261931d9a5c83de0a425cb4b8b25ddab2b169fbf113aecd')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cd "${srcdir}/${_basename}-${pkgver}"

    ./configure \
        --build=i686-pc-linux-gnu\
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd "${srcdir}/${_basename}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/share"

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
