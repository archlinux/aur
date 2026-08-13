# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-dbusqml
_projname=dbusqml
pkgver=0.3.0
pkgrel=1
pkgdesc="Standalone D-Bus binding for QML (no KDE dependencies)"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/dbusqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
provides=("qt6-dbusqml=${pkgver}")
conflicts=('qt6-dbusqml-git' 'qt6-dbusqml-reactive')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2bc447dc36383adc73601b3e59003778b19e5e30d09bdfa5a1ed4ae1a3ea88b')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
