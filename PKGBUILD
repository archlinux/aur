# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.5.3
pkgrel=1
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=('x86_64')
url="https://www.pikatorrent.com/"
_githuburl="https://github.com/G-Ray/pikatorrent"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('56152791fedc58391b7b6368841a784327b6cfdc5b73766cd1d587c7474a62b2'
            '37b888cccd0f10bb2e5050669fc534cfbeb1651bdd64afb177f8900b48d4d91c')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    asar pack "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}