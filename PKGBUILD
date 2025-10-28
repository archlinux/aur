# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=claw-bin
pkgver=1.2.21
pkgrel=2
pkgdesc="Crustacean powered clipboard manager for X11 & Wayland"
arch=('x86_64')
conflicts=('claw')
url="https://github.com/saltnpepper97/claw"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
)
options=('!strip' '!debug' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/claw_${pkgver}_amd64.deb")
sha256sums_x86_64=('6ae7f6240458a136702ea185829b824465b7c458832743f19383d7dd8d3983f5')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  
  local _appname="claw"
  
  if [ -d "${pkgdir}/usr/lib/${_appname}/_up_/examples" ]; then
    install -dm755 "${pkgdir}/usr/share/doc/${_appname}"
    cp -a "${pkgdir}/usr/lib/${_appname}/_up_/examples/." "${pkgdir}/usr/share/doc/${_appname}/"
  fi
  
  if [ -f "${pkgdir}/usr/lib/${_appname}/_up_/LICENSE" ]; then
    install -Dm644 "${pkgdir}/usr/lib/${_appname}/_up_/LICENSE" \
      "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
  fi
  
  rm -rf "${pkgdir}/usr/lib/${_appname}/_up_"
}
