# Maintainer: redtide <redtid3@gmail.com>

_pkgname=voltrayke
pkgname="${_pkgname}-git"
pkgver=r19.227c9f1
pkgrel=1
pkgdesc="Audio volume system tray widget"
url="https://github.com/redtide/${_pkgname}"
arch=("x86_64")
license=("GPL2")
depends=("qt5-base" "alsa-lib" "libpulse")
makedepends=("cmake" "git" "qt5-tools")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+${url}")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname}"
    cmake -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev \
        -B build \
        -S .
    cmake --build build --target all
}
package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --build build --target install
}
