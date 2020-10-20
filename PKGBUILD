# Maintainer: redtide <redtid3@gmail.com>

_pkgname="colorpick"
pkgname="${_pkgname}-git"
pkgver=r54.16e386d
pkgrel=1
pkgdesc="Color picker and contrast checker"
url="https://github.com/agateau/${_pkgname}"
arch=('x86_64')
license=('BSD')
depends=('qt5-base' 'kguiaddons' 'kwidgetsaddons')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+https://github.com/agateau/${_pkgname}.git")
sha256sums=('SKIP')
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
