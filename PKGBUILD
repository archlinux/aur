# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-topqml
_projname=topqml
pkgver=0.1.1
pkgrel=1
pkgdesc="Qt6/QML module: system monitoring collectors (btop-derived) with QML bindings"
options=(!debug)
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/topqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
provides=()
conflicts=('qt6-topqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('360632d0223fef5c2b8b8db217e944ee9d5870226df2b9828c2a0ef5e5bb1c92')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
