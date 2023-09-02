# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=snsdeck-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="SNS Viewer like TweetDeck"
arch=('any')
url="https://github.com/meganii/snsdeck"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/meganii/snsdeck/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('8f77c42da4d97e5bb19c20a52184c6ab71c1e03434808ac8fbd80776af1c9392'
            '2e219a81b7fc05809c9301bd7c759388e69a1e70540517abf1b41f3cfd19e717'
            'ff4900d33943117c871fed30ff62d669ffbe4d009e15e406ba1608a3ec7b1f4f')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}