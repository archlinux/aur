# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21-unstable
pkgver=3.2_dev.3
pkgrel=1
pkgdesc="Freeciv for the 21st Century (Unstable version from master branch)"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt6-base' 'qt6-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.2-dev.3/Freeciv21-v3.2-dev.3.tar.gz")
sha256sums=('bfbfc33f79818179c0733c43c55db622f125d0979379a6dc94cb32d3e346c06c')
build() {
    cd freeciv21
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DFREECIV_DOWNLOAD_FONTS=OFF \
        -DFREECIV_ENABLE_CIVMANUAL=OFF \
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
