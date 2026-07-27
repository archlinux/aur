# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21
pkgver=3.1.2
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21-unstable')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.1.2/Freeciv21-v3.1.2.tar.gz")
sha256sums=('3fe8c9a3c576c00c5af4490611ccd63cd99a50014f7fea9143f817fbe978ccca')
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
