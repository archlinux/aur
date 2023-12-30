# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.0_patch.2
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.0-patch.2/Freeciv21-v3.0-patch.2.tar.gz")
sha256sums=('741cc30f69b551fec6ac0146eef1a4606220d3e28ba5521b64a2e434e6a9f85f')

build() {
    cd Freeciv21-v3.0-patch.2
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd Freeciv21-v3.0-patch.2
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v3.0-patch.2
    DESTDIR="$pkgdir" cmake --install build
}
