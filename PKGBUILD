# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="messages4desktop-bin"
pkgver=p20230716
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron')
makedepends=('gendesk' 'asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z"
    "${pkgname%-bin}.sh")
sha256sums=('72f58e8499b1dba5d3af3c895d14a66324cf260e45b4970f523ae725a286c2ed'
            'f503979c34e57e5c11b6fb9bfc4aebf854e95c0261074ca654fce466ea1ac39d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/dist/GoogleMessages-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/dist/GoogleMessages-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/GoogleMessages-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network;Utility" --name "Google Messages" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}