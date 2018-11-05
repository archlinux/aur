# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
# Contributors:
#   Stefan Husmann <stefan-husmann@t-online.de>
#   Amin Bandali <bandali@gnu.org>

# TL;DR: install otf-alegreya, not ttf-alegreya

# AFAICS, the original design is made with the cubic Bézier curves which are
# stored in the OTF version; TTF's quadratic curves are an approximation.
#
# The OTF has no hinting, the TTF has hinting generated via ttfautohint (which,
# to the best of my knowledge, uses the same algorithm as FreeType does for
# fonts without hints). Thus, the existence of hinting instructions is purely
# of academical interest as long as the fonts are viewed using FreeType (or any
# other backend that supports automatic hinting, such as ClearType on Windows).
#
# For general users, the OTF version should be the preferred choice.
#
# (Cf. https://github.com/huertatipografica/Alegreya/issues/17)

_pkgname=alegreya
pkgbase=otf-alegreya
pkgname=(otf-alegreya ttf-alegreya)
pkgver=2.008
pkgrel=2
_pkgdesc='An elegant and versatile type family for comfortable reading (serif sub-family of the Alegreya "super family")'
pkgdesc="${_pkgdesc}"
arch=('any')
depends=('fontconfig')
url='https://www.huertatipografica.com/en/fonts/alegreya-ht-pro'
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/huertatipografica/Alegreya/archive/v${pkgver}.tar.gz")
sha256sums=('44dacbe3c4b60c203b1d60f0a55ebf6c139823f83fd234f9b078ece7cb15676e')
license=('custom:OFL')

package_otf-alegreya() {
  pkgdesc="${_pkgdesc} (OTF version)"

  install -m644 -Dt "${pkgdir}/usr/share/fonts/OTF/" \
    "${srcdir}"/Alegreya-${pkgver}/fonts/otf/*.otf
  install -Dm644 \
    "${srcdir}/Alegreya-${pkgver}/OFL.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}

package_ttf-alegreya() {
  pkgdesc="${_pkgdesc} (TTF version)"
  conflicts=('ttf-google-fonts-git')

  install -m644 -Dt "${pkgdir}/usr/share/fonts/TTF/" \
    "${srcdir}"/Alegreya-${pkgver}/fonts/ttf/*.ttf
  install -Dm644 \
    "${srcdir}/Alegreya-${pkgver}/OFL.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
