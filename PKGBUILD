# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="messages4desktop-bin"
pkgver=p20230702
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glib2' 'pango' 'at-spi2-core' 'libcups' 'dbus' 'libxrandr' 'cairo' 'glibc' 'alsa-lib' 'nspr' 'libxcomposite' 'libxkbcommon' 'gtk3' \
    'libxcb' 'libdrm' 'nss' 'libxext' 'mesa' 'libx11' 'libxdamage' 'libxfixes' 'gcc-libs' 'expat')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z")
sha256sums=('3721a7bdbbd979e712357682b07f78f204d6a456ad639ada9327774597067eb1')
   
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/dist/GoogleMessages-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Network;Utility" --name "Google Messages" --exec "/opt/${pkgname%-bin}/GoogleMessages %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}