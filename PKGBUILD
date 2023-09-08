# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.6.1
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
sha256sums=('57c63bf3c824a69435ad36ba783bdf0f9379fa0065c528f6f08bd9a1bfab98e2'
            '37b888cccd0f10bb2e5050669fc534cfbeb1651bdd64afb177f8900b48d4d91c')
prepare() {
    asar pack "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}