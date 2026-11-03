# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=aflow
pkgver=4.1.0
pkgrel=1
pkgdesc="Automatic FLOW framework for autonomous materials discovery"
arch=('x86_64')
url="https://materials.duke.edu/aflow.html"
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'zlib'
    'openssl'
    'readline'
)
makedepends=(
    'cmake'
    'ninja'
    'gcc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aflow-org/aflow/archive/refs/tags/v4.1.tar.gz")
sha256sums=('e5e9ee76f57845bb30f7fb087b05bcf65feba1c7569a162f6b397999606f7d6e')

options=('!lto')

build() {
    cd "${pkgname}-4.1/src"
    cmake -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${pkgname}-4.1/src"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-4.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
