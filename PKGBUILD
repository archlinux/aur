# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-xdgiconqml
_projname=xdgiconqml
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt 6 QML plugin implementing the XDG Icon Theme Specification (v0.13)"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/xdgiconqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
conflicts=('qt6-xdgiconqml-git' 'qt6-xdgiconqml-dbus' 'qt6-xdgiconqml-dbus-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4017958aaba9791e5799fc72ae8447ed0db4026de741ade50e4e94abe5b955e9')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DWITH_DBUS_BROADCAST=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
