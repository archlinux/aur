# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=realm-studio-bin
_pkgname="Realm Studio"
pkgver=14.1.2
pkgrel=1
pkgdesc='A tool, any developer or system administrator would use when building and maintaining their app built on the Realm Mobile Platform.'
arch=('x86_64')
url="https://realm.io/products/realm-studio/"
_ghurl="https://github.com/realm/realm-studio"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron24'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/realm/realm-studio/v${pkgver}/resources/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('927cbb21cf043d08218bcee442767fceeae9007ac182d4c191ec2f4ab2347abd'
            'b805ac8f6d254316eb3d5bb052d58e36054a933401e4f493af66e1c6cd2ed0fb'
            'aa87b86d8b35f283ece808bb9c13b3e55307c616c24107958494bf911b884324')
build() {
    gendesk -q -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}