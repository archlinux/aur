# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=messages4desktop-bin
_appname=GoogleMessages
pkgver=p20230813
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z"
    "${pkgname%-bin}.sh")
sha256sums=('827b535593fb54c52dfe84c4b00d7ed61338d9eaf225032d28f7c18c114d7e4c'
            '357b6bfe2dc636633fb50f129b6814b4bf1378f11ca322db51e1700fcdb9ac86')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/dist/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network;Utility" --name "Google Messages" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}