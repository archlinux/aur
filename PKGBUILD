# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="warpgui-bin"
pkgver=1.5
pkgrel=1
pkgdesc="GUI for Cloudflare ™ WARP"
arch=('x86_64')
url="https://github.com/AKotov-dev/warpgui"
license=('GPL3')
depends=('gtk2' 'at-spi2-core' 'sh' 'cairo' 'libx11' 'pango' 'hicolor-icon-theme' 'glibc' 'gdk-pixbuf2' 'glib2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.x86_64.rpm")
sha256sums=('d87a40586c607db11adb2e6b2b1c2ad11cd29ecda345ae09bd4d3f1b40524815')
 
package() {
  cp --parents -a {etc,usr} "${pkgdir}"
  install -Dm755 -d "${pkgdir}/opt"
  mv "${pkgdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt/"
  sed 's|Exec=/usr/share/warpgui/warpgui|Exec=/opt/warpgui/warpgui|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "${pkgdir}/usr/share/icons/${pkgname%-bin}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
  install -Dm755 "${pkgdir}/etc/systemd/system/warp-svc.service" "${pkgdir}//usr/lib/systemd/system/warp-svc.service"
  rm -rf "${pkgdir}/usr/share/icons/${pkgname%-bin}.png" "${pkgdir}/etc/systemd/system" "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
}