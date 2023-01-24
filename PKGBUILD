# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.0_rc.2
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v${pkgver//_/-}/Freeciv21-v${pkgver//_/-}.tar.gz")
sha256sums=('ed77c1d0bdf0ce2c3db9952108f2d51eca346481d706423a104ae73fa3a5ffae')

build() {
    cd Freeciv21-v${pkgver//_/-}
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd Freeciv21-v${pkgver//_/-}/build
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v${pkgver//_/-}
    DESTDIR="$pkgdir" cmake --install build
}
