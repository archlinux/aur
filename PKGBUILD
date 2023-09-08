# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slack-on-keys-bin
pkgver=1.1.0
pkgrel=3
pkgdesc="Control your Slack from any app window with keyboard shortcuts ⚡ Set up custom keyboard shortcuts for various Slack actions"
arch=('x86_64')
url="https://github.com/yakshaG/slack-on-keys"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/yakshaG/slack-on-keys/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('73e383feed41399ef29c309be84eeb252ad6b26ab51c3db40b8485384e856fc1'
            'f95d9068a4ccb1cbc8bad397f046494b5e2d6546fd6be7546edd5c26765cd956'
            '275f937ff79c415fd8b335b7cbcb8aa88202976dc01cbaebd2946ef537fe583e')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}