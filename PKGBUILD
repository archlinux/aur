# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=AriaNg
pkgname="${_pkgname,,}"
pkgver=1.3.12
pkgrel=1
pkgdesc="A modern web frontend making aria2 easier to use."
arch=('any')
url="https://github.com/mayswind/${_pkgname}"
license=('MIT')
makedepends=("npm" "gulp")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('baa3b2e0010bb568ff12257c65f1eb57cefdf390a3e2b63e55c47c333bd15f43')

build() {
    cd "${_pkgname}-${pkgver}"
    npm install
    gulp clean build
}

package() {
    cd "${_pkgname}-${pkgver}/dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
