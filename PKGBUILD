# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=tesseract
pkgname=lib32-tesseract
pkgver=3.05.01
pkgrel=1
pkgdesc="An OCR program (32 bit)"
arch=(x86_64)
url="https://github.com/tesseract-ocr/tesseract"
license=("APACHE")
depends=(lib32-leptonica tesseract)
source=($_basename-$pkgver.tar.gz::https://github.com/tesseract-ocr/tesseract/archive/$pkgver.tar.gz)
sha256sums=('05898f93c5d057fada49b9a116fc86ad9310ff1726a0f499c3e5211b3af47ec1')

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
