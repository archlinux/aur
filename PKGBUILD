# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sentencepiece-browsermt
pkgver=0.2
pkgrel=2
pkgdesc="SentencePiece for BrowserMT"
arch=('x86_64')
url="https://github.com/kroketio/sentencepiece-browsermt"
license=('Apache')
depends=('protobuf-21')
makedepends=('cmake' 'protobuf-21')
source=("https://github.com/kroketio/sentencepiece-browsermt/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1cdd7b4ef66efad3cfb8c0aa7ac78d648a616b37649c4919056eb94dc3202d29')

build() {
    cd "$srcdir/sentencepiece-browsermt-$pkgver"
    mkdir -p build && cd build
    cmake .. \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SPM_BUILD_LIBRARY_ONLY=ON \
        -D Protobuf_INCLUDE_DIR="/usr/include/protobuf-21" \
        -D Protobuf_LIBRARY="/usr/lib/protobuf-21/libprotobuf.so" \
        -D Protobuf_LITE_LIBRARY="/usr/lib/protobuf-21/libprotobuf-lite.so" \
        -D Protobuf_PROTOC_EXECUTABLE="/usr/bin/protoc-21"
    make
}

package() {
    cd "$srcdir/sentencepiece-browsermt-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
