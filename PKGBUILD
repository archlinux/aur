# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-mpvqml
_projname=mpvqml
pkgver=0.3.0
pkgrel=1
pkgdesc="Qt6 QML video player element backed by libmpv"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mpvqml"
license=('GPL-3.0-or-later AND LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'mpv')
makedepends=('cmake')
conflicts=('qt6-mpvqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce15ef421edfb770befbe801529b2073d4f93ee5581122c6d0d1cd3ec03acfc9')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -dm755 "${pkgdir}/usr/share/licenses"
    ln -s ../mpvqml/licenses "${pkgdir}/usr/share/licenses/${pkgname}"
}
