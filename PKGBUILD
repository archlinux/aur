# Maintainer: onurmercury <onurmercury at proton dot me>

# Releases and details about builds can be found at:
# https://github.com/Stremio/stremio-service
#
# Check new releases:
# curl -sf https://api.github.com/repos/Stremio/stremio-service/releases | grep -om1 '"tag_name": *"[^"]*"' | awk -F'"' '{print $4}'

_debname=stremio-service

pkgname=${_debname}-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Companion app for Stremio Web"
arch=('x86_64')
url="https://github.com/Stremio/stremio-service"
license=('GPL-2.0')
depends=('glib2'
         'gcc-libs'
         'gdk-pixbuf2'
         'gtk3'
         'cairo'
         'libayatana-appindicator')
conflicts=('stremio-service')
source=("https://github.com/Stremio/stremio-service/releases/download/v${pkgver}/${_debname}_amd64.deb")
sha512sums=('83419ea074d68b3870145306b32a1613f66d9c224b0a13a25739b27b8913242db6ef0a8757ff0cd34243621e871213da7fdee9b73041d9976b56b546a8242915')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Move license
  install -Dm644 "${pkgdir}/usr/share/stremio-service/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/stremio-service/LICENSE.md"
  rm "${pkgdir}/usr/share/stremio-service/LICENSE.md"

  # Remove Debian specific documents
  rm -r "${pkgdir}/usr/share/doc/"
}
