pkgname=mbelib-neo-git
pkgver=r29.f7b04d6
pkgrel=1
pkgdesc="P25 Phase 1 and ProVoice IMBE and Half-rate AMBE vocoder library (modernized fork)"
arch=('x86_64' 'aarch64')
url="https://github.com/arancormonk/mbelib-neo"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('mbelib-neo')
conflicts=('mbelib-neo')
options=('staticlibs')
source=("$pkgname::git+https://github.com/arancormonk/mbelib-neo.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMBELIB_BUILD_TESTS=OFF \
        -DMBELIB_BUILD_EXAMPLES=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
