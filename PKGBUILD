# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=guiwrapper-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A simple cross platform graphical user interface (GUI) wrapper to launch executable desktop applications"
arch=('x86_64')
url="https://github.com/frodal/GUIwrapper"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxrandr' 'nss' 'libxkbcommon' 'libdrm' 'cairo' 'expat' 'libxcomposite' 'alsa-lib' \
    'libxdamage' 'libxfixes' 'gtk3' 'at-spi2-core' 'libcups' 'mesa' 'glib2' 'dbus' 'pango' 'nspr' 'libxext')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/GUIwrapper-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/frodal/GUIwrapper/master/assets/icons/png/512x512.png")
sha256sums=('9fe4cd794aae62af8867149fe22a05859b03974871963bf37f9617556ebaf085'
            'c2655948673313ef780c59ed39d9cc8d7db09929330223d44e8014f0860435ba')
 
package() {
   install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/GUIwrapper-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
   install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pimaps"
   gendesk -f --icon "${pkgname%-bin}" --categories "Development;Utility" --name "GUIwrapper" --exec "/opt/${pkgname%-bin}/GUIwrapper %U"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}