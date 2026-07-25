# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-dbusqml-reactive
_projname=dbusqml
pkgver=0.2.0
pkgrel=1
pkgdesc="Standalone D-Bus binding for QML (no KDE dependencies) — reactive bindings enabled"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/dbusqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
provides=("qt6-dbusqml=${pkgver}")
conflicts=('qt6-dbusqml' 'qt6-dbusqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('290025370d3cfed204a843dd682ccfa7f90b77c15c0f2f80908efa8f2fbb0917')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DDBUSQML_REACTIVE_BINDINGS=ON \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
