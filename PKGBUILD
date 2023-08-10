# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=3fa-bin
pkgver=1.0.0
pkgrel=4
pkgdesc="A secure and scalable multi-factor authentication system including a client application, admin dashboard, and backend server"
arch=('x86_64')
url="https://3fa.netlify.app/"
_githuburl="https://github.com/Computing-Collective/3FA"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('40f4e82e01ef079c8458d73fe3af28f5df76422cf4b33ffcb2a1ab3eeb68ab7d'
            '80826bdce47d3b74a8580b1f65bb20cae1004c4dfe6dfadaf1cfc7baf385307d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|3fa %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}