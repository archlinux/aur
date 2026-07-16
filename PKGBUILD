pkgname=librescc
pkgver=1.0.0
pkgrel=1
pkgdesc="MIDI to SCC-inspired chiptune player with real-time synthesis and a GTK4 GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/polska4au/librescc"
license=('GPL-3.0-or-later')
depends=('gtk4' 'portaudio' 'lame')
makedepends=('cmake' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/polska4au/librescc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7d2d5a84669c12da483b44d03ff707d263e418cd7472037e7da4a94ca539642')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
