# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="epub-reader"
_pkgname="Epub-Reader"
_appname="EpubReader"
pkgver=1.0.3
pkgrel=2
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('x86_64')
url="https://mignaway.github.io/epub-reader-website/"
_githuburl="https://github.com/mignaway/${_appname}"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'nodejs' 'gendesk')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname}.png")
sha256sums=('e0ffa61a33131541064cc926094ee7cc0dac5db73096757ec522cca9906ddfcb'
            '797d17c2545b03a4d1b5a0ad6ef7af7a449780cb4d7071573d5005e317939fe9'
            'd034cd2388f2a9e28885ba9a718d510fe8a9744b5dc3ad57b7a4f1a2ef90c8da')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    yarn install 
    yarn run build
}
package() {
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm755 "${srcdir}/${_appname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}