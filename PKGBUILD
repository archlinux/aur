# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=invader
pkgver=0.41.0
pkgrel=1
pkgdesc="An open source toolkit for creating maps and assets for Halo: Combat Evolved"
depends=('libtiff' 'libarchive' 'libsquish' 'flac' 'freetype2' 'libsamplerate'
         'libvorbis' 'qt5-base' 'qt5-multimedia' 'zlib' 'zstd')
makedepends=('cmake' 'ninja' 'python')
arch=('x86_64')
url="https://invader.opencarnage.net"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz"
        "0000_fix_version_display.patch::https://github.com/SnowyMouse/invader/commit/7cbe776dcb7c02b6c4283cbf8fd54b0fd40139fe.patch")
sha256sums=('19d5f5cc7a251256e50a35607cd0a1ad24edf2c525a2546196e85f19b896fa6c'
            '33ae75e56c5bd72646dbeee02a0892fff3643fa56dd4e87845bb74cca7c96e16')

prepare() {
    mkdir -p build
    cd "$srcdir"/$pkgname-$pkgver
    patch -Np1 <"${srcdir}"/0000_fix_version_display.patch
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
