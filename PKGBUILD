# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="affine-bin"
_appname=AFFiNE
pkgver=0.7.0.beta.1
_pkgver=0.7.0-beta.1
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron25' 'sqlite')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${_pkgver}/${pkgname%-bin}-beta-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('8fc2f3bb8419d4fcd8e10de73e6b04a3c418e66193b0c2c17517ca2f4bf87801'
            '81b2d1b5306fb6a9a9624cf94d455af1717272f564cbc91000f0a4783144c5f6'
            '055bb0dc83e69f100f4df20573572bc8fae9788e9abf22d62a101cd9d62452c4')
package() {
    asar pack "${srcdir}/${_appname}-beta-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-beta-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}