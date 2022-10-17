# Maintainer: kerojiang <kero_jiang@126.com>
# Contributor: kerojiang <kero_jiang@126.com>

pkgname="konica-minolta-c266-series"
pkgver="60003.0000"
pkgrel=1
pkgdesc="CUPS PostScript driver for KONICA MINOLTA bizhub C266 Series (C226/C266)"
url="https://www.konicaminolta.eu/en/business-solutions/support/download-center.html"
arch=("any")
license=('custom:konica minolta commercial license')
depends=("cups")
makedepends=('gzip')
_distdir="BHC266PPDLinux_${pkgver//.}MU"
source=(
  "https://p.knova.konicaminolta.com/PublicDownload/download?fileId=6BC17559-AB3B-44C1-B492-5BA788A3F558"
  "LICENSE"
)
sha256sums=(
  'f3a30d21a96ed4c4b4d341e3665e14bc8b64310712890b92be23b7cab6e1e65c'
  'a3dcdd6459b4a376c61ad8c69ced0f356581229b39b209debe1679749824c408'
)

package() {
  cd "$srcdir"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ppdmodel="${pkgdir}/usr/share/cups/model"
  
  # OpenOffice printer driver (same for all languages)
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC266opn.ppd" "${ppdmodel}/KOC266opn.ppd"

  # Language specific generic printer driver
  #install -D -m 644 "${_distdir}/Chinese_Simplified/CUPS1.2/KOC266SCX.ppd" "${ppdmodel}/KOC266SCX.ppd"
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC266UX.ppd" "${ppdmodel}/KOC266UX.ppd"
}
