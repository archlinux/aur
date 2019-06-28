# Maintainer: Guillaume Dolle <dolle.guillaume@gmail.com>

set -u
_driver='c368-series'
pkgname=$(echo "konica-minolta-bizhub-${_driver}" | tr '[:upper:]' '[:lower:]')
pkgver='110001.0000'; _dl1='201806'; _dl2='07062011'
pkgrel='1'
pkgdesc='CUPS PostScript printer driver for bizhub C658 C558 C458 C368 C308 C258'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_srcdir="IT5PPDLinux_${pkgver//\./}"
source=(
  "https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/${_dl1}/${_dl2}/${_srcdir}MU.zip"
  "LICENSE"
)
sha256sums=('d16a4cdce996c6a63376b6a9c4d33280ac0ff3bdbd88a006af88ebd3627accbb'
            '10884cdf2badf6d9749038e56d25bb46175568ddcadfdc98a6c8b1739d66568f')
_srcdir+='MU'
package() {
  set -u
  local _ppds=('KOC759UX' 'KOC759opn')
  local _ppd
  for _ppd in "${_ppds[@]}"; do
    install -Dpm644 "${_srcdir}/English/CUPS1.2/${_ppd}.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  done
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
