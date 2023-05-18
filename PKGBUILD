# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="niconizer-bin"
pkgver=2.0.98
pkgrel=1
pkgdesc="A desktop application that displays plain text, images, and any other HTML content on the screen."
arch=("x86_64")
url="https://github.com/matzkoh/niconizer"
license=('MIT')
depends=('libxext' 'libxrandr' 'libxfixes' 'libxkbcommon' 'glib2' 'mesa' 'glibc' 'alsa-lib' 'libdrm' 'expat' 'nspr' 'cairo' 'libxdamage' \
    'libxcomposite' 'gcc-libs' 'nss' 'gtk3' 'libxcb' 'libcups' 'at-spi2-core' 'pango' 'dbus' 'libx11')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/matzkoh/niconizer/master/icon/icon_512x512.png")
sha256sums=('c607b69e97d9d5a3d74d05f733ccd5353c61545ac275e8ba722375f4d82233b8'
            '7c820610080a8d47f26c555d498ae391c89f2848de93cde005f1fd438e1e0236')
package() {
   install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
   install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
