# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=warpgui-bin
pkgver=1.9
pkgrel=1
pkgdesc="GUI for Cloudflare ™ WARP"
arch=('x86_64')
url="https://github.com/AKotov-dev/warpgui"
license=('GPL3')
depends=('gtk2' 'at-spi2-core' 'cairo' 'libx11' 'pango' 'glibc' 'gdk-pixbuf2' 'glib2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.${CARCH}.rpm")
sha256sums=('591c61749a377ef587ca552c3c4e277513c57bcf9052e9ff8acf0dbd74e34512')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    sed "s|Exec=/usr/share/${pkgname%-bin}/${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}