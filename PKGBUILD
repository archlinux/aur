# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=woof-doom
_pkgname=woof
pkgver=10.0.3
pkgrel=1
pkgdesc="Woof! is a continuation of Lee Killough's Doom source port MBF targeted at modern systems"
arch=(x86_64)
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
depends=(sdl2 sdl2_net sdl2_mixer) # TODO: Add fluidsynth as a dependency?
makedepends=(cmake)
conflicts=(woof-git)
source=("https://github.com/fabiangreffrath/${_pkgname}/archive/refs/tags/${_pkgname}_${pkgver}.tar.gz")
sha256sums=(20d0fc575cfb81423211df2c38bd1785bd7a5e2c84a163783ac6124c712cc73b)

build() {
    cmake -B build -S "${_pkgname}-${_pkgname}_${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
