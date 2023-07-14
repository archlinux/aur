# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=guiwrapper-bin
pkgver=0.7.3
pkgrel=2
pkgdesc="A simple cross platform graphical user interface (GUI) wrapper to launch executable desktop applications"
arch=('x86_64')
url="https://github.com/frodal/GUIwrapper"
license=('MIT')
depends=('bash' 'electron23')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/GUIwrapper-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/frodal/GUIwrapper/master/assets/icons/png/512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('9fe4cd794aae62af8867149fe22a05859b03974871963bf37f9617556ebaf085'
            'c2655948673313ef780c59ed39d9cc8d7db09929330223d44e8014f0860435ba'
            '6cca17090d4757951f409076c7c181c6c5dbc70fdf767399e00fa22c7b287bc0')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm755 "${srcdir}/GUIwrapper-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   install -Dm644 "${srcdir}/GUIwrapper-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pimaps"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Development;Utility" --name "GUIwrapper" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}