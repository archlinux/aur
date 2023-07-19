# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="seven-desktop-bin"
pkgver=1.3.0
pkgrel=2
pkgdesc="The official cross-platform desktop application for the seven.io SMS Gateway."
arch=('x86_64')
url="https://www.seven.io/en/docs/apps/desktop/"
_githuburl="https://github.com/seven-io/desktop"
license=('MIT')
prpvodes=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('a7a9efc3ab8ff386a5c9827dbc825daf482e18f2e8528bd936925e5d6c2aa8a6'
            '29824a583e8db7fb26f240d4bf88df261aefa06192a7351862b63892e5c51d53')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}