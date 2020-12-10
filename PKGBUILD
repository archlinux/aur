# Maintainer: redtide <redtid3@gmail.com>

_pkgname=magnifiqus
pkgname="${_pkgname}-git"
pkgver=r21.09a21c9
pkgrel=1
pkgdesc="Qt based screen magnifier"
url="https://github.com/redtide/${_pkgname}"
arch=("x86_64")
license=("GPL2")
makedepends=("cmake" "qt5-tools")
depends=("qt5-base")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+${url}")
sha512sums=('SKIP')
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" "${srcdir}/${pkgname}"
    cmake --build . --target all
}
package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
