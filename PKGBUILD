# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=warpgui
pkgname="${_pkgname}-bin"
pkgver=1.4
pkgrel=1
pkgdesc="GUI for Cloudflare ™ WARP"
arch=('x86_64')
url="https://github.com/AKotov-dev/warpgui"
license=('GPL3')
depends=(nftables zenity p7zip fping curl gdk-pixbuf2 glib2 at-spi2-core glibc pango cairo libx11 gtk2 hicolor-icon-theme)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-0.mrx9.x86_64.rpm")
sha256sums=('7baeb719c1f43209a6694410f0807200972d8c6387fe89cfb3607f2fb8d4b433')
 
package() {
  cp --parents -a {etc,usr} "${pkgdir}"
  install -Dm755 -d "${pkgdir}/opt"
  mv "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/opt/"
  rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  sed 's/Exec=\/usr\/share\/warpgui\/warpgui/Exec=\/opt\/warpgui\/warpgui/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
  install -Dm755 "${pkgdir}/etc/systemd/system/warp-svc.service" "${pkgdir}//usr/lib/systemd/system/warp-svc.service"
  rm -rf "${pkgdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/etc/systemd/system"
}