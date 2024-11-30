# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=AriaNg
pkgname="${_pkgname,,}"
pkgver=1.3.8
pkgrel=1
pkgdesc="A modern web frontend making aria2 easier to use."
arch=('any')
url="https://github.com/mayswind/${_pkgname}"
license=('MIT')
makedepends=("npm" "gulp")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('23b8b6611b3c8d05c98052dd9d70fab4601b1b41cf56341055ee6a9087f562cb')

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
