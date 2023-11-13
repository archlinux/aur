# Maintainer: onurmercury <onurmercury at proton dot me>

# New releases and details about builds can be found at:
# https://github.com/Stremio/stremio-service

_debname=stremio-service

pkgname=${_debname}-bin
pkgver=0.1.8
pkgrel=2
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
sha256sums=('6ac4a8c309aace567aaf9ac8c078c3236d03b06b81da9dc3557aeafd5e375911')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Move license
  install -Dm644 "${pkgdir}/usr/share/stremio-service/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/stremio-service/LICENSE.md"
  rm "${pkgdir}/usr/share/stremio-service/LICENSE.md"

  # Remove Debian specific documents
  rm -r "${pkgdir}/usr/share/doc/"
}
