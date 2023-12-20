# Maintainer: onurmercury <onurmercury at proton dot me>

# Releases and details about builds can be found at:
# https://github.com/Stremio/stremio-service
#
# Check new releases:
# curl -sf https://api.github.com/repos/Stremio/stremio-service/releases | grep -om1 '"tag_name": *"[^"]*"' | awk -F'"' '{print $4}'

_debname=stremio-service

pkgname=${_debname}-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="Companion app for Stremio Web"
arch=('x86_64')
url="https://github.com/Stremio/stremio-service"
license=('GPL-2.0')
depends=('cairo'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'libayatana-appindicator')
conflicts=("${_debname}")
provides=("${_debname}")
source=("${_debname}_v${pkgver}-${arch}.deb::https://github.com/Stremio/stremio-service/releases/download/v${pkgver}/${_debname}_amd64.deb")
sha512sums=('103d55b6a2a32021295d51d9cf076831b3aba38ec6fb49603f8e29eb453196da97546faadb510d056669dbbea0f5cd8b39562cf56265960fa964ca9532fac1ff')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Move license
  install -Dm644 "${pkgdir}/usr/share/stremio-service/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/stremio-service/LICENSE.md"
  rm "${pkgdir}/usr/share/stremio-service/LICENSE.md"

  # Remove Debian specific documents
  rm -r "${pkgdir}/usr/share/doc/"
}
