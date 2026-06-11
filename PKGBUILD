pkgname=dsd-neo
pkgver=2.1.0
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
sha256sums=('1fc5e056837fd09404ac76a4f4be24ab0871498fb9e8e3cc5b019488d711f485')

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
