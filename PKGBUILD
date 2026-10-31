# Maintainer: Alex Indigo <ai at aegis dot one>
# Rebuild and reverify the private adapter gate before changing the Qt version.

pkgname=qt6-configqml
_projname=configqml
pkgver=0.2.0
pkgrel=1
pkgdesc="Layered configuration for Qt and QML"
arch=('x86_64')
url="https://github.com/alexindigo/configqml"
license=('LGPL-3.0-or-later')
depends=('qt6-base=6.12.0' 'qt6-declarative=6.12.0' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake' 'ninja')
provides=("qt6-configqml=${pkgver}")
conflicts=('qt6-configqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bac377fe3ec8a15cfdbb56820d038757f8ea9ee6efcf2d2870b69404e516d763')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel 4
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
