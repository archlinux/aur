# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epub-reader
_pkgname=Epub-Reader
_appname=EpubReader
pkgver=1.0.5
pkgrel=1
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('any')
url="https://mignaway.github.io/epub-reader-website/"
_githuburl="https://github.com/mignaway/${_appname}"
license=('MIT')
depends=('bash' 'electron18')
makedepends=('yarn' 'nodejs' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname}.png")
sha256sums=('db951ca3860576e8810343b145009ccd3b5719185517b227950bb3caa27bbc9c'
            'acab316db73b9e1f5ba19cba0df5449227fa257b1013f05e37041ad0237180e0'
            'd034cd2388f2a9e28885ba9a718d510fe8a9744b5dc3ad57b7a4f1a2ef90c8da')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    yarn install 
    yarn run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm755 "${srcdir}/${_appname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}