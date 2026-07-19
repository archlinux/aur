# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-mpvqml
_projname=mpvqml
pkgver=0.1.1
pkgrel=1
pkgdesc="Bridge between MPV (libmpv + MpvQt) and Qt6 QML"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mpvqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'mpv' 'mpvqt')
makedepends=('cmake')
conflicts=('qt6-mpvqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48067261b346d7c5f0b7916f979824de5490cb783150ec35e6d844c5dc0a9542')

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
