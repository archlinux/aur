# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=realm-studio-bin
pkgver=14.0.3
pkgrel=3
pkgdesc='A tool, any developer or system administrator would use when building and maintaining their app built on the Realm Mobile Platform.'
arch=('x86_64')
url="https://realm.io/products/realm-studio/"
_githuburl="https://github.com/realm/realm-studio"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/realm/realm-studio/v${pkgver}/resources/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('af0783f448d37267f7967f0d82c54cca6cffc073d9563061a81a18888c9ab003'
            'b805ac8f6d254316eb3d5bb052d58e36054a933401e4f493af66e1c6cd2ed0fb'
            '9b9bafab04ef5ba6062bd6ddf02e031002cbd864d2f6025103deea9f68c093db')
prepare() {
    gendesk -f -n --categories "Development;Utility" --name "Realm Studio" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}