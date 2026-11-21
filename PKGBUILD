# Maintainer: Alex Indigo <ai at aegis dot one>
# Rebuild and reverify the private adapter gate before changing the Qt version.

pkgname=qt6-configqml
_projname=configqml
pkgver=0.5.3
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
sha256sums=('fa8cbef36535cc447b7a24ecbb5c144af465bce84a0a04fd778690e567d4e756')

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
