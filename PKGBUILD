# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=qt6-mpvqml-git
_release_ver=1.0.r0
pkgver="${_release_ver}.g0000000"
pkgrel=1
pkgdesc="Bridge between MPV (libmpv + MpvQt) and Qt6 QML"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mpvqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'mpv' 'mpvqt')
makedepends=('cmake' 'git')
provides=('qt6-mpvqml')
conflicts=('qt6-mpvqml')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --always 2>/dev/null || echo "${_release_ver}.g$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
