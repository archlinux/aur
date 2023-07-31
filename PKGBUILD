# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="messages4desktop-bin"
pkgver=p20230730
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z"
    "${pkgname%-bin}.sh")
sha256sums=('4d557cda5ab70b192c92691cc7d81ab24ec4f19da9e092b5bcb31f3016326b0d'
            '357b6bfe2dc636633fb50f129b6814b4bf1378f11ca322db51e1700fcdb9ac86')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/dist/GoogleMessages-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/dist/GoogleMessages-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/GoogleMessages-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network;Utility" --name "Google Messages" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}