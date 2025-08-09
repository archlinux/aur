# Maintainer: Pranav S <pranav.ppanch@gmail.com>

pkgname=freeciv21-unstable
pkgver=3.1_rc.4
pkgrel=1
pkgdesc="Freeciv for the 21st Century (Unstable version from master branch)"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer' 'karchive5' 'libertinus-font')
makedepends=('cmake' 'ninja' 'python')
conflicts=('freeciv21')
source=("$pkgname-$pkgver.tar.gz::https://github.com/longturn/freeciv21/releases/download/v3.1-rc.4/Freeciv21-v3.1-rc.4.tar.gz")
sha256sums=('9ff9bbe0ea7e65971f67416e0485bb8892f9356bef07b42e4119b08aef416ac4')
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
