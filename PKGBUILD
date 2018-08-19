# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=chromaprint
pkgname="lib32-$_basename"
pkgver=1.4.3
pkgrel=2
pkgdesc='Library that implements a custom algorithm for extracting fingerprints from any audio source (32-bit)'
url='https://acoustid.org/chromaprint'
arch=('x86_64')
license=('LGPL')
depends=('lib32-ffmpeg' 'chromaprint')
makedepends=('cmake')
source=("https://github.com/acoustid/chromaprint/releases/download/v${pkgver}/chromaprint-${pkgver}.tar.gz")
sha256sums=('ea18608b76fb88e0203b7d3e1833fb125ce9bb61efe22c6e169a50c52c457f82')

prepare() {
    mkdir build
}

build() {
    cd build

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake "../$_basename-v$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd build

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    rm -r include
    mv lib lib32
}
