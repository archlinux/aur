# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='ecos'
pkgver='2.0.8'
pkgrel=1
pkgdesc="A lightweight conic solver for second-order cone programming."
url="https://www.embotech.com/ECOS"
depends=()
makedepends=()
license=('GPL3')
arch=('x86_64')
source=("https://github.com/embotech/ecos/archive/v${pkgver}.tar.gz")
sha256sums=('d905d16599efd927a75b29852c3476ff1ffd0b97ab27d5b8ad63bb4ff2ad8130')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release ..
}

build() {
    cd "${pkgname}-${pkgver}/build"
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
