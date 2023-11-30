# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.0_patch.1
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.0-patch.1/Freeciv21-v3.0-patch.1.tar.gz")
sha256sums=('ff3ab4a79ada46b3431c2853dc20b0c115c2cc2332032ab590a18c1f54090059')

build() {
    cd Freeciv21-v3.0-patch.1
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd Freeciv21-v3.0-patch.1
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v3.0-patch.1
    DESTDIR="$pkgdir" cmake --install build
}
