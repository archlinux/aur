# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname=eiquadprog
pkgname=(${_pkgname} ${_pkgname}-docs)
pkgver=1.2.0
pkgrel=1
pkgdesc="Quadratic Programing solver with eigen"
arch=('any')
url="https://github.com/${pkgorg}/${_pkgname}"
license=('LGPL')
depends=()
optdepends=('doxygen')
makedepends=('cmake' 'boost' 'boost-libs' 'eigen')
source=($url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cd "${_pkgname}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

check() {
    cd "${_pkgname}-${pkgver}"
    make test
}

package_eiquadprog() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    rm -rf ${pkgdir}/usr/share/doc
    install -Dm644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_eiquadprog-docs() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    rm -rf ${pkgdir}/usr/{lib,include}
    install -Dm644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
