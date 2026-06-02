pkgname=mbelib-neo
pkgver=2.0.0
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
sha256sums=('7c6176f77743a354426ba278149fae1960f15e21988b079155414cf3b3ee1919')

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
