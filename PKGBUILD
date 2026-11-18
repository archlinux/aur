# Maintainer: Alex Indigo <ai at aegis dot one>
# Rebuild and reverify the private adapter gate before changing the Qt version.

pkgname=qt6-configqml
_projname=configqml
pkgver=0.5.1
pkgrel=1
pkgdesc="Layered configuration for Qt and QML"
arch=('x86_64')
url="https://github.com/alexindigo/configqml"
license=('LGPL-3.0-or-later')
depends=('qt6-base=6.12.0' 'qt6-declarative=6.12.0' 'libgcc' 'libstdc++' 'glibc')
makedepends=('cmake')
provides=("qt6-configqml=${pkgver}")
conflicts=('qt6-configqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff2950caea6f4e17d5ef659f6c3c17b0593095b1e2ba065f1902fec6f5b2aa48')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel 4
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
