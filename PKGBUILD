# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21-unstable
pkgver=3.1_alpha.5
pkgrel=1
pkgdesc="Freeciv for the 21st Century (Unstable version from master branch)"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.1-alpha.5/Freeciv21-v3.1-alpha.5.tar.gz")
sha256sums=('189846911c9af2a332881b0bfccf48b916cf9f9fe25ddfe42b25f2e7616076b6')

build() {
    cd Freeciv21-v3.1-alpha.5
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
    cd Freeciv21-v3.1-alpha.5
    ctest --output-on-failure

}

package() {
    cd Freeciv21-v3.1-alpha.5
    DESTDIR="$pkgdir" cmake --install build
}
