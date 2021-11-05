# Maintainer: redtide <redtid3@gmail.com>

_pkgname=qruler
pkgname="${_pkgname}-git"
pkgver=r1.433894f
pkgrel=1
pkgdesc="A simple on-screen pixel meter"
url="https://github.com/redtide/${_pkgname}"
arch=("x86_64")
license=("GPL3")
depends=("qt5-base")
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
