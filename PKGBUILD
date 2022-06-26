# Maintainer: Pranav S <pranav.ppanch@gmail.com>

_basename=freeciv21
pkgname=freeciv21
pkgver=3.0_beta.2
pkgrel=1
pkgdesc="Freeciv for the 21st Century"
arch=('x86_64')
url="https://github.com/longturn/freeciv21"
license=('GPL3')
depends=( 'lua' 'qt5-base' 'qt5-svg' 'sdl2_mixer')
makedepends=('cmake' 'ninja')
source=("https://github.com/longturn/freeciv21/releases/download/v${pkgver//_/-}/v${pkgver//_/-}.tar.gz")
options=('!strip')

sha256sums=('SKIP')

build() {
    cmake . -B build  -G Ninja\
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -Wno-deprecated-declarations
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
