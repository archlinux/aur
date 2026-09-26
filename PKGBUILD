# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-topqml
_projname=topqml
pkgver=0.2.0
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
sha256sums=('aba09333a75c4f42eec34eeec2eb9d5e720ba9d09d93c3079ae200fa32df8ea3')

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
