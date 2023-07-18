# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="japreader-bin"
pkgver=2.0.0beta.1
_pkgver=2.0.0-beta.1
pkgrel=2
pkgdesc="An Electron app that helps you read Japanese text."
arch=('x86_64')
url="https://github.com/marisukukise/japReader"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('bash' 'electron22')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${_pkgver}/${pkgname%-bin}_2.0.0.beta.1_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('e4784785955392445335aee668d92276076be9a23cb91948db4c977752356ba3'
            'a326cf1cd04372e48f7dba06ac6751f80815cc7278e8e0601a47ce74a4a9f37d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}