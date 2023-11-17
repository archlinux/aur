# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-bin
_appname=AFFiNE
pkgver=0.10.2
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
    'sqlite'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-stable-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('893fd57a9f17052abe9bc72cc3f6d8d0e70a39c37b9df85245c5193d6a911fbc'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            'f14e62d4c9b4ce833d555627989225329217bf8ebffcab2622af19e41037329c')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app-update.yml" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}