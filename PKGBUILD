# Maintainer: Caleb Jamison (cbjamo@gmail.com)

pkgname="collada-dom"
provides=("colladadom")
pkgver=2.5.0
pkgrel=4
pkgdesc="An API that provides a C++ object representation of a COLLADA XML instance document."
url="https://github.com/rdiankov/collada-dom/"
license=("custom")
arch=("x86_64" "aarch64")
depends=("libxml2"
         "boost-libs"
         "pcre"
		 "minizip")
makedepends=("cmake"
             "boost")
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/rdiankov/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("3be672407a7aef60b64ce4b39704b32816b0b28f61ebffd4fbd02c8012901e0d")

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    install -Dm644 "${pkgname}-${pkgver}/licenses/license_e.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    DESTDIR="${pkgdir}" cmake --install build
}
