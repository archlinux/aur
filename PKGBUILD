# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shoppinglist-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A user-friendly shopping list application developed using Electron and MaterializeCss."
arch=("x86_64")
url="https://github.com/MillerSpil/ShoppingListApplication"
license=('MIT')
depends=('libxext' 'libxrandr' 'libxfixes' 'libxkbcommon' 'glib2' 'mesa' 'glibc' 'alsa-lib' 'libdrm' 'expat' 'nspr' 'cairo' 'libxdamage' \
    'libxcomposite' 'gcc-libs' 'nss' 'gtk3' 'libxcb' 'libcups' 'at-spi2-core' 'pango' 'dbus' 'libx11' 'nodejs' 'gdk-pixbuf2')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/production-linux/${pkgname%-bin}-linux-x64.7z")
sha256sums=('e109b2e649081083a3c0374f1d26bc00242892bf5fc5478158dfed29521610d1')
package() {
   install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
   install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/assets/icons/png/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "ShoppingList" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} --no-sandbox %U"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}