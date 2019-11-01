# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=tesseract
pkgname=lib32-tesseract
pkgver=4.1.0
pkgrel=1
pkgdesc="An OCR program (32 bit)"
arch=(x86_64)
url="https://github.com/tesseract-ocr/tesseract"
license=("APACHE")
depends=(lib32-leptonica lib32-libarchive tesseract)
source=($_basename-$pkgver.tar.gz::https://github.com/tesseract-ocr/tesseract/archive/$pkgver.tar.gz)
sha256sums=('5c5ed5f1a76888dc57a83704f24ae02f8319849f5c4cf19d254296978a1a1961')

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
