# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jasper-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A flexible and powerful issue reader for GitHub"
arch=('x86_64')
url='https://jasperapp.io/'
_githuburl="https://github.com/jasperapp/jasper"
license=('MIT')
depends=('glibc' 'libxdamage' 'libxfixes' 'mesa' 'libx11' 'libxkbcommon' 'libdrm' 'dbus' 'at-spi2-core' 'libxcomposite' 'nss' \
    'gtk3' 'alsa-lib' 'cairo' 'pango' 'libxcb' 'gdk-pixbuf2' 'libcups' 'gcc-libs' 'glib2' 'nspr' 'libxext' 'expat' 'libxrandr')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/jasperapp/jasper/master/misc/logo/jasper.iconset/icon_512x512.png")
sha256sums=('53f5158ac169cb4462f22fd1a4a4a5e4555cde3aac70d8a1d8b92bc6a5d8f3ca'
            '606dd64bd59eb00a0a34a171483131bc2c10e9bf237ecfc36176cc89e596d3c4')
 
package() {
    install -Dm 755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/Jasper/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/Jasper/Jasper"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}