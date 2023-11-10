# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=owa-desktop-bin
pkgver=1.0.1
pkgrel=3
pkgdesc="A simple Outlook Web (Office 365) Desktop application, built using Electron.js"
arch=('x86_64')
url="https://github.com/mikepruett3/owa-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/mikepruett3/owa-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('caa33aa8dab46de479837d3218598c30789a676dd5857ddd20ea22966a1adf32'
            '82f04c17c97a90cb676f7eec2bdeca09cfff8a6779b310226d8e750a70abad79'
            '0126a8f807d59d77b30afbcd0a946affdf2cfd14a6670723b00144966e94e825')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}