# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.1.0
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21-unstable')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.1.0/Freeciv21-v3.1.0.tar.gz")
sha256sums=('269b3b8647c8cda5c2f06c3b00bd6ff162f5ba920414f45432f34b88ad4452e2')
build() {
    cd freeciv21
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd freeciv21
    ctest --output-on-failure

}

package() {
    cd freeciv21
    DESTDIR="$pkgdir" cmake --install build
}
