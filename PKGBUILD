# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=qt6-niriqml
_projname=niriqml
pkgver=0.1.1
pkgrel=1
pkgdesc="Typed QML bindings for niri IPC (windows, workspaces, events, actions)"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/niriqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
optdepends=('niri: the compositor niriqml is designed to talk to')
conflicts=("qt6-niriqml-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4e866a28916ee87334bc7266f4ef5adaf0e558b853606ab975905bd18961852')

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
