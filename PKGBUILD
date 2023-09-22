# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-canary-bin
_appname=AFFiNE-canary
pkgver=0.9.0_canary.13
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.Beta Version."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-canary-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-canary-bin}")
depends=('bash' 'electron26' 'sqlite')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('e2fb5b66339d4e4083aa7b6b7fb7b45ecd57d55e2767fad4d60a3bb0e75b7164'
            'ae03ba58b58e8db23d1845e417e2779f3293d8a2e0c43ca622495ac90be751d1'
            '52f5a382a84c1af01d5abf6709f01911af7928d37d7468f90d3cad6d5839222b')
build() {
    asar pack "${srcdir}/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}