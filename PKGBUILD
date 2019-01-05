# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=tesseract
pkgname=lib32-tesseract
pkgver=4.0.0
pkgrel=1
pkgdesc="An OCR program (32 bit)"
arch=(x86_64)
url="https://github.com/tesseract-ocr/tesseract"
license=("APACHE")
depends=(lib32-leptonica tesseract)
source=($_basename-$pkgver.tar.gz::https://github.com/tesseract-ocr/tesseract/archive/$pkgver.tar.gz)
sha256sums=('a1f5422ca49a32e5f35c54dee5112b11b99928fc9f4ee6695cdc6768d69f61dd')

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    [ -x configure ] || ./autogen.sh
    [ -f Makefile ] || ./configure \
                            --build=i686-pc-linux-gnu \
                            --prefix=/usr \
                            --libdir=/usr/lib32

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r bin include share
}
