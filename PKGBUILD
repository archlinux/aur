# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=openexr
pkgname=lib32-openexr
pkgver=2.3.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="http://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-ilmbase' 'lib32-zlib' 'openexr')
source=("https://github.com/openexr/openexr/releases/download/v$pkgver/$_basename-$pkgver.tar.gz")
sha256sums=('fd6cb3a87f8c1a233be17b94c74799e6241d50fc5efd4df75c7a4b9cf4e25ea6')

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

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
