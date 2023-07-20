# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shoppinglist-bin"
pkgver=1.0.0
pkgrel=2
pkgdesc="A user-friendly shopping list application developed using Electron and MaterializeCss."
arch=("x86_64")
url="https://github.com/MillerSpil/ShoppingListApplication"
license=('MIT')
depends=('bash' 'electron17')
makedepends=('asar')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/production-linux/${pkgname%-bin}-linux-x64.7z"
    "${pkgname%-bin}.sh")
sha256sums=('e109b2e649081083a3c0374f1d26bc00242892bf5fc5478158dfed29521610d1'
            'd82a6f76dfef0f7c9967477f553427eb79414bf127123227a88f25abd23b403f')
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
   asar pack "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icons/png/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "ShoppingList" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}