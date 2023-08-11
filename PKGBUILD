# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bulkurlopener-bin
pkgver=1.12.0
pkgrel=3
pkgdesc="An application that provides the user with multiple utilities to help with managing and using large amounts of urls"
arch=("x86_64")
url="https://bulkurlopener.com/"
_githuburl="https://github.com/EuanRiggans/BulkURLOpener"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron20')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "LICENSE::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/master/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/master/app/icon/128.png"
    "${pkgname%-bin}.sh")
sha256sums=('793be180c3a33e952b64aed41c6f8dff8023987ac620f39d0877df4cb7e27ced'
            '02fee1b93a53fbf997a300a147ea7efb5fe2deee2f0d0c6d2f66862a7b7079c7'
            'bd7825f6ae86c0d580b50ca9e7885e15af5ad2a81689a8e2d41decb70231fad5'
            'caf276aac9254f592a5a44ab61f562af1a317931bc92dc54f7c3b0c0a7f4c10c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}