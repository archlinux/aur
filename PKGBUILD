# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-bin
_appname=AFFiNE
pkgver=0.8.0
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'sqlite')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-stable-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9c82f97c1de6780376b977bbd68ce5ef7da38f5fa0b6baa919d95b311edfb7b6'
            '81b2d1b5306fb6a9a9624cf94d455af1717272f564cbc91000f0a4783144c5f6'
            '055bb0dc83e69f100f4df20573572bc8fae9788e9abf22d62a101cd9d62452c4')
prepare() {
    asar pack "${srcdir}/${_appname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}