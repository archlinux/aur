# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="warpgui-bin"
pkgver=1.6
pkgrel=1
pkgdesc="GUI for Cloudflare ™ WARP"
arch=('x86_64')
url="https://github.com/AKotov-dev/warpgui"
license=('GPL3')
depends=('gtk2' 'at-spi2-core' 'cairo' 'libx11' 'pango' 'glibc' 'gdk-pixbuf2' 'glib2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.x86_64.rpm")
sha256sums=('f35265a45d6e419738e4b699e0a5e9b065105073dbe339b761bc59ed24a62402')
 
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    sed "s|Exec=/usr/share/${pkgname%-bin}/${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}