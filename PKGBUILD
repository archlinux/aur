# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

set -u
_driver='BHC360'
pkgname=$(echo "konica-minolta-bizhub-${_driver}" | tr '[:upper:]' '[:lower:]')
pkgver='10000.0001'
pkgrel='2'
pkgdesc='CUPS PostScript printer driver for bizhub C220 C280 C360'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_driver="${_driver//-/}"
_srcdir="${_driver^^}PPDLinux_${pkgver//\./}"
source=(
  "https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=60f41c84e052e29e0a161466d4b78a02&tx_kmanacondaimport_downloadproxy[documentId]=84232&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685"
  "LICENSE"
)
#_srcdir+='MU'
sha256sums=('774e85ae0e7e19f0160891d2a2bf5b85563ca3348e51c2ba0d93c20b879006bb'
            'a3dcdd6459b4a376c61ad8c69ced0f356581229b39b209debe1679749824c408')

package() {
  set -u
  local _ppds=('KOC360UX')
  local _ppd
  for _ppd in "${_ppds[@]}"; do
    install -Dpm644 "${_srcdir}/English/CUPS1.2/${_ppd}.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  done
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
