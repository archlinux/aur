# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
pkgname=claw
pkgver=1.0.1
pkgrel=1
pkgdesc="Crustacean powered clipboard manager for X11 & Wayland"
arch=('x86_64')
url="https://github.com/saltnpepper97/claw"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=(
    'xclip: X11 clipboard support'
    'wl-clipboard: Wayland clipboard support'
)
options=('!strip' '!debug' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/claw_${pkgver}_amd64.deb")
sha256sums_x86_64=('ed7b61319a2dcc7bd723f6670cb23ed0ab4a7314115d496a9135e62ae71cf43a')

package() {
  # Extract debian package data
  tar -xf data.tar.gz -C "${pkgdir}"
  
  # Ensure examples are in the correct location
  if [ -d "${pkgdir}/usr/lib/${pkgname}/examples" ]; then
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r "${pkgdir}/usr/lib/${pkgname}/examples" "${pkgdir}/usr/share/doc/${pkgname}/"
  fi
  
  # Install license to proper location for AUR
  if [ -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" ]; then
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
