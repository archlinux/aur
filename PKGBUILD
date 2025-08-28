# Maintainer: Exorcism
pkgname=rvthtool
pkgver=2.0.1
pkgrel=1
pkgdesc="RVT-H Toolset (CLI + GUI) for managing Nintendo RVT-H"
arch=('x86_64')
url="https://github.com/GerbilSoft/rvthtool"
license=('GPL2')
depends=('qt6-base' 'kwidgetsaddons' 'kcoreaddons' 'extra-cmake-modules')
makedepends=('cmake' 'make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2693ab96e254e80d3d5d75a27581921d8e757b9eb75990203e12270ed176c5a12bfd04f717c06f2a83be4150bec1af3b2e2d5dba8b43a386d8fd62f44ccb2378')

# prevent strip issues (binaries already contain debug sections)
options=(!strip)

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
