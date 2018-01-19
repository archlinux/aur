# Maintainer:  Chris Severance <aur.severach@spamgourmet.com>
# Contributor: shieldwed <shieldwed [at] outlook [dot] com>

set -u
_driver='ic-601'
pkgname="konica-minolta-bizhub-${_driver}"
pkgver='20000.0001'; _dl1='201601'; _dl2='28024107'
pkgrel=1
pkgdesc='CUPS PostScript printer driver for bizhub PRESS C7000 C6000'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_driver="${_driver//-/}"
_srcdir="${_driver^^}PPDLinux_${pkgver//\./}"
source=(
  "https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/${_dl1}/${_dl2}/${_srcdir}MU.zip"
  "LICENSE"
)
#_srcdir+='MU'
sha256sums=('962ede21a50d218363d218202cd5b0eac7142be443dcfb4cce291172b577c7c9'
            'a3dcdd6459b4a376c61ad8c69ced0f356581229b39b209debe1679749824c408')

package() {
  set -u
  local _ppds=('KOC7000UX')
  local _ppd
  for _ppd in "${_ppds[@]}"; do
    install -Dpm644 "${_srcdir}/English/CUPS1.2/${_ppd}.ppd" -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/"
  done
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
