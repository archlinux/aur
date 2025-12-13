pkgname=dsd-neo-git
pkgver=r678.36cb5fa
pkgrel=1
pkgdesc="Digital Speech Decoder - A modern, modular, and performance enhanced C/C++ decoder for digital voice. DMR, P25, NXDN, YSF, and more."
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/dsd-neo"
license=('GPL-3.0-or-later')
depends=(
    'mbelib-neo'
    'libsndfile'
    'itpp'
    'ncurses'
    'libpulse'
    'rtl-sdr'
    'codec2'
)
makedepends=(
    'git'
    'cmake'
)
provides=('dsd-neo')
conflicts=('dsd-neo')
source=("${pkgname}::git+https://github.com/arancormonk/dsd-neo.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
