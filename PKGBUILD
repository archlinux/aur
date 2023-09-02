# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goofcord-bin
_appname=GoofCord
pkgver=0.7.3
pkgrel=1
pkgdesc="Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client."
arch=('x86_64')
url="https://github.com/Milkshiift/GoofCord"
license=("OSL3")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('electron25' 'hicolor-icon-theme' 'bash')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/Milkshiift/GoofCord/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('42286b28b8bec21d1db4e9b8d84e9b13501a6d221baeea02e73b60eb33f6c820'
            '4e7f66aa93929feee2db20f14f871e7ddcc69236b0ecfb79a19ade9b859daf51'
            'aabefa2507892f1affaafc65996c3f3334cdb49b3d276b613c2e79a42a55d113')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    asar extract "${srcdir}/${_appname}-${pkgver}-linux-x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}