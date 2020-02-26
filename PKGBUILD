# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=tesseract
pkgname=lib32-tesseract
pkgver=4.1.1
pkgrel=1
pkgdesc="An OCR program (32 bit)"
arch=(x86_64)
url="https://github.com/tesseract-ocr/tesseract"
license=("APACHE")
depends=(lib32-leptonica lib32-libarchive tesseract)
source=($_basename-$pkgver.tar.gz::https://github.com/tesseract-ocr/tesseract/archive/$pkgver.tar.gz)
sha256sums=('2a66ff0d8595bff8f04032165e6c936389b1e5727c3ce5a27b3e059d218db1cb')

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
