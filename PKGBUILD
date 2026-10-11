pkgname=mbelib-neo
pkgver=2.4.0
pkgrel=1
pkgdesc="P25 Phase 1 and ProVoice IMBE and Half-rate AMBE vocoder library (modernized fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/mbelib-neo"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake')
conflicts=('mbelib-neo-git')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55eba4021f3cf8203bb60e6141d1a78030032a5c480acc95ba5e915bd1aee76a')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMBELIB_BUILD_TESTS=OFF \
        -DMBELIB_BUILD_EXAMPLES=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
