# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.0_patch.3
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.0-patch.3/Freeciv21-v3.0-patch.3.tar.gz")
sha256sums=('c5a0f29528a4e1fe86e75654e536964adae52ac5e9e4299b3ce008f8ba317f79')

build() {
    cd Freeciv21-v3.0-patch.3
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd Freeciv21-v3.0-patch.3
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v3.0-patch.3
    DESTDIR="$pkgdir" cmake --install build
}
