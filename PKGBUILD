# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-dbusqml
_projname=dbusqml
pkgver=0.6.0
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
sha256sums=('32362a6d85e57ac4269d51576ad458c81aaa6cada2fca6c5c49958d64c25f376')

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
