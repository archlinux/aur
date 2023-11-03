# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ldraw-parts-library
pkgver=20231103
pkgrel=1
pkgdesc="A collection of LDraw-format CAD files representing many of LEGO bricks produced"
arch=(any)
url="http://www.ldraw.org/parts/latest-parts.html"
license=('CCPL: cc-by-2.0')
options=(!strip)
source=(ldraw-parts.zip::https://www.ldraw.org/library/updates/complete.zip
        LDConfig.ldr::https://www.ldraw.org/library/official/LDConfig.ldr
        "ldraw-parts-library.sh" "license")
sha256sums=('a164a0bf1885213ff6c6ae90dd5805097d57ea858ccfae3129792b65f10f5aa9'
            'd7b17215287600f0fee0b2dd3f5c37391ed06e6a1c9e3b3785882a493c9b750a'
            '7cbd598861cc678e86ce07da220e97d0f9d27f2b8d0d03b794400b999fd6fc42'
            '783990d0de8daf6b0e18b1c06578438f7d70e106a1a351686872d8d6eeeba7ac')

pkgver() {
  echo $(date -uI|sed 's,-,,g')
}

package() {
  cd "${srcdir}/ldraw/"

  # Install data
  mkdir -p                      "${pkgdir}/usr/share/ldraw"
  cp ../LDConfig.ldr            "${pkgdir}/usr/share/ldraw/"
  mv p                          "${pkgdir}/usr/share/ldraw/"
  mv parts                      "${pkgdir}/usr/share/ldraw/"

  # Fix permissions
  find "${pkgdir}/usr/share/ldraw" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/share/ldraw" -type d -exec chmod 755 {} +

  # Install the old version 2.0 CC-by license
  install -D -m644 ../license                "${pkgdir}/usr/share/licenses/${pkgname}/license"

  install -D -m755 ../ldraw-parts-library.sh "${pkgdir}/etc/profile.d/ldraw-parts-library.sh"
}
