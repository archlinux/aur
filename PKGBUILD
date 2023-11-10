# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webcam-glass-bin
_appname=Glass
pkgver=0.7.2
pkgrel=4
pkgdesc="Cross-platform tool for making video tutorials and video conferencing, blending the webcam over the screen."
arch=('x86_64')
url="https://github.com/jersonlatorre/webcam-glass-app"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron20'
    'hicolor-icon-theme'
)
makepends=(
    'asar'
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_appname}-${pkgver}_standalone_linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('6e9b08a0a3089616afbed76a660290b75de27342dc20f840e4239cee0db74e53'
            'fc3655a6dcf9e9cf9f797cc579b3be1cdcb783b4f30dea56623ca39a1801708f')
build() {
    asar extract "${srcdir}/${_appname}-${pkgver}_Linux/resources/app.asar" "${srcdir}/app.asar.unpacked"
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}_Linux/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}_Linux/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}_Linux/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}