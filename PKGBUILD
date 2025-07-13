# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=AriaNg
pkgname="${_pkgname,,}"
pkgver=1.3.11
pkgrel=1
pkgdesc="A modern web frontend making aria2 easier to use."
arch=('any')
url="https://github.com/mayswind/${_pkgname}"
license=('MIT')
makedepends=("npm" "gulp")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('16c532a5326afcf11163235ead11398682110289e7be5b85144efc4ba0360cbd')

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
