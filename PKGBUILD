# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goofcord-bin
_appname=GoofCord
pkgver=0.7.5
pkgrel=1
pkgdesc="Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client."
arch=('x86_64')
url="https://github.com/Milkshiift/GoofCord"
license=("OSL3")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/Milkshiift/GoofCord/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('922f4b92b3c26b84c203b8553fad1d0cff44a5b72426b0dda8ce6845e5fb2386'
            '4e7f66aa93929feee2db20f14f871e7ddcc69236b0ecfb79a19ade9b859daf51'
            'aabefa2507892f1affaafc65996c3f3334cdb49b3d276b613c2e79a42a55d113')
prepare() {
    asar extract "${srcdir}/${_appname}-${pkgver}-linux-x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    gendesk -f -n --categories "Network" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/gf_logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}