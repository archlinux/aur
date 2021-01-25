# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader
pkgver=0.41.3
pkgrel=1
pkgdesc="An open source toolkit for creating maps and assets for Halo: Combat Evolved"
depends=('libtiff' 'libarchive' 'libsquish' 'flac' 'freetype2' 'libsamplerate'
         'libvorbis' 'qt5-base' 'qt5-multimedia' 'zlib' 'zstd')
makedepends=('cmake' 'ninja' 'python')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f817b5dda544c6bd4bbfc90c431a52a474e1302a6e52e19ed25482031ec55145')

prepare() {
    mkdir -p build
}

build() {
    cd "$srcdir"/build
    cmake ../$pkgname-$pkgver -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    ninja
}

package() {
    cd "$srcdir"/build
    ninja install
}
