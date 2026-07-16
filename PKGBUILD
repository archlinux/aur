pkgname=dsd-neo
pkgver=2.4.0
pkgrel=1
pkgdesc="Digital Speech Decoder - A modern, modular, and performance enhanced C/C++ decoder for digital voice. DMR, P25, NXDN, YSF, and more."
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/dsd-neo"
license=('GPL-3.0-or-later')
depends=(
    'mbelib-neo'
    'libsndfile'
    'openssl'
    'ncurses'
    'libpulse'
    'rtl-sdr'
    'soapysdr'
    'codec2'
    'curl'
)
makedepends=(
    'cmake'
    'help2man'
)
conflicts=('dsd-neo-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d2a55ffe90fa29a20b4e176f2ac6a21b4b2ca77a4b473c4f328fcee481ad8352')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
