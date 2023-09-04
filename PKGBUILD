# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=messages4desktop-bin
_appname=GoogleMessages
pkgver=p20230903
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
sha256sums=('8fda138c75a25013d013e9f80d62bb2475c7bd03ea65c2f64144f83c4f7a8266'
            '357b6bfe2dc636633fb50f129b6814b4bf1378f11ca322db51e1700fcdb9ac86')
prepare() {
    asar pack "${srcdir}/dist/${_appname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Network;Utility" --name "Google Messages" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}