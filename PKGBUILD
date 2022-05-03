# Maintainer: Caleb Jamison (cbjamo@gmail.com)

pkgname="collada-dom"
provides=("colladadom")
pkgver=2.5.0
pkgrel=2
pkgdesc="An API that provides a C++ object representation of a COLLADA XML instance document."
url="https://github.com/rdiankov/collada-dom/"
license=("custom")
arch=("x86_64")
depends=("libxml2"
         "boost-libs"
         "pcre"
		 "minizip")
makedepends=("cmake"
             "boost")
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/rdiankov/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("3be672407a7aef60b64ce4b39704b32816b0b28f61ebffd4fbd02c8012901e0d")

build() {
    cd "${pkgname}-${pkgver}"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "../${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "licenses/license_e.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
