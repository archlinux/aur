# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.0_patch.4
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21-unstable')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.0-patch.4/Freeciv21-v3.0-patch.4.tar.gz")
sha256sums=('674b7b706c328e230cbebfa13907000bb124a75195982a3174e4c7209568fcac')

build() {
    cd Freeciv21-v3.0-patch.4
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd Freeciv21-v3.0-patch.4
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v3.0-patch.4
    DESTDIR="$pkgdir" cmake --install build
}
