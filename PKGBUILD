# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=claw-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Crustacean powered clipboard manager for X11 & Wayland"
arch=('x86_64')
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
sha256sums_x86_64=('5fb49c6df982ceca5476d9ee8e994f5972a9e79376396afd740912c24a5d5991')

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
