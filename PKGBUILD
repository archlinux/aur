# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=('x86_64')
url="https://www.pikatorrent.com/"
_githuburl="https://github.com/G-Ray/pikatorrent"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('bash' 'electron25')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('a98e8f3f51068e30ad3f99f836db4d240b132703f74d1e8e6849184f5fee4eba'
            '37b888cccd0f10bb2e5050669fc534cfbeb1651bdd64afb177f8900b48d4d91c')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network;Utility" --name "PikaTorrent" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}