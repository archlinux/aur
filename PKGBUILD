# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sqlite3-page-explorer-bin
pkgver=1.0
pkgrel=1
pkgdesc="Cross Platform app to explore internal organisation of tables and indices"
arch=('x86_64')
url="https://github.com/siara-cc/sqlite3_page_explorer"
license=('Apache')
depends=('libcups' 'nss' 'gcc-libs' 'libxfixes' 'fontconfig' 'cairo' 'libxi' 'libxtst' 'libxext' 'libxrandr' 'libxcb' 'libx11' 'gdk-pixbuf2' \
    'alsa-lib' 'pango' 'at-spi2-core' 'gtk3' 'libxss' 'glib2' 'expat' 'libxcomposite' 'dbus' 'libxcursor' 'nspr' 'glibc' 'libxrender' 'libxdamage')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}-linux/${pkgname%-bin}-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/siara-cc/sqlite3_page_explorer/master/res/img/siara_cc_3d.png")
sha256sums=('92b07fa1b44f7d07e5fb275b0dba8cf7ed84817dc7b98f5a20e52529d1ee1f9a'
            '7ef8dd87b2d77fe2c4acbb9c2573b29b2ced763614f46ff6176e399130bb12dd')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/"*  "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Development" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}