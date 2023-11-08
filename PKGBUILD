# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=raj-browser-bin
pkgver=2.0.5
pkgrel=3
pkgdesc="A UI and privacy focussed browser for the web from the web."
arch=('x86_64')
license=('custom')
conflicts=("${pkgname%-bin}")
url="https://github.com/Rajaniraiyn/raj-browser"
depends=(
    'bash'
    'electron22'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('b0ff6a0abff0fe3f8510aa5f12bae954eab07cb0441ee5971685d3335fa91b79'
            'ea63cc87484f5ca49318425a9ee2c5c9ac3920d5de6613634ad37a8c397cdf70')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g;s|Utility|Network;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}