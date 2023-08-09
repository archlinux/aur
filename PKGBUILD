# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webcam-glass-bin
_appname=Glass
pkgver=0.7.2
pkgrel=2
pkgdesc="Cross-platform tool for making video tutorials and video conferencing, blending the webcam over the screen."
arch=('x86_64')
url="https://github.com/jersonlatorre/webcam-glass-app"
license=('custom')
conflits=("${pkgname%-bin}")
depends=('electron20' 'bash' 'hicolor-icon-theme')
makepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Glass-${pkgver}_standalone_linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('6e9b08a0a3089616afbed76a660290b75de27342dc20f840e4239cee0db74e53'
            'b1856203b951988d76d6aac33cf1ccd8b2b4579585be0a2eedd63c6223c98705')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}_Linux/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    asar extract "${srcdir}/${_appname}-${pkgver}_Linux/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}_Linux/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}