# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-mpvqml
_projname=mpvqml
pkgver=0.3.1
pkgrel=1
pkgdesc="Qt6 QML video player element backed by libmpv"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mpvqml"
license=('GPL-3.0-or-later AND LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'mpv')
makedepends=('cmake')
conflicts=('qt6-mpvqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c6e05c0bbdbe557b83791c83fc6c8a216153e31772b92cd593a7d414ad9859a')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_INSTALL_LIBDIR:PATH=lib \
        -DCMAKE_INSTALL_LIBEXECDIR:PATH="lib/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -dm755 "${pkgdir}/usr/share/licenses"
    ln -s ../mpvqml/licenses "${pkgdir}/usr/share/licenses/${pkgname}"
}
