# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=messages4desktop-bin
_appname=GoogleMessages
pkgver=p20231008
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z"
    "${pkgname%-bin}.sh")
sha256sums=('b9c1d1bc2383bc3912a191cc73b6865c9ba7713ec3dac5b5bb69151e48cdf7d6'
            '3efbacfb2f57f840d4c602f4dad0cd97934040a099d3463a37a3901372ee7662')
build() {
    asar pack "${srcdir}/dist/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
    gendesk -q -f -n --categories "Network;Utility" --name "Google Messages" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}