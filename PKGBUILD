# Maintainer:  Chris Severance <aur.severach@spamgourmet.com>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

set -u
_mode='423'
_driver="BH${_mode}"
pkgname=$(echo "konica-minolta-bizhub-${_driver}-series" | tr '[:upper:]' '[:lower:]')
pkgver='100000000'; _dl1='201201'; _dl2='12063342'
pkgrel='1'
pkgdesc="CUPS PostScript printer driver for bizhub ${_mode} series (423/363/283/223)"
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_driver="${_driver//-/}"
_srcdir="${_driver^^}PPDLinux_${pkgver//./}"
source=(
  #"https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/${_dl1}/${_dl2}/${_srcdir}MU.zip"
  "${_srcdir}MU.zip::https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=63bd482b3f842bcd90001475e6fb51c1&tx_kmanacondaimport_downloadproxy[documentId]=83216&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685"
  "LICENSE"
)
#_srcdir+='MU'
md5sums=('6f8b5f25387373cd9a3cba8b8157c9fd'
         '3a1e2985ae6d6b136f80e186f55a11f3')
sha256sums=('93004629b073ee415abef28288c3ebb9f86b05c844db57bcb6b973a1cc05ccc0'
            'a3dcdd6459b4a376c61ad8c69ced0f356581229b39b209debe1679749824c408')

package() {
  set -u
  local _ppds=("KO${_mode}UX" "KO${_mode}opn")
  local _ppd
  for _ppd in "${_ppds[@]}"; do
    install -Dpm644 "${_srcdir}/English/CUPS1.2/${_ppd}.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  done
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
