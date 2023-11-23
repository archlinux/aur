# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-canary-bin
_pkgname=AFFiNE-canary
pkgver=0.10.3_canary.0
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.Beta Version."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-canary-bin}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-canary-bin}"
)
depends=(
    'electron27'
    'sqlite'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('764c9f3b8405adecc433ea0c2dc9eb5cc57a3e183ffec158ceac7aea2bb096f9'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            'a817ebd2064b598eda6a260191859ad0d3919ba10074110f8dddbfb4cbd50c54')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}