# Maintainer: Guillaume Dolle <dolle.guillaume@gmail.com>
_driver='c368-series'
_fileid='a0d1e722160b7d611d4324007e4b7fc3'
_documentid='124088'
_type='1558521685'
_system='KonicaMinolta'
_lang='EN'

set -u
pkgname=$(echo "konica-minolta-bizhub-${_driver}" | tr '[:upper:]' '[:lower:]')
pkgver='1.23';
pkgrel=3
pkgdesc='CUPS PostScript printer driver for bizhub (423 4750 4752 5020I 554E 652 750I 754 C35 C360 C360I C368 C3850 C3851 C650I C652D C658 C754 C759 WPH)'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_srcdir="KMbeuUXv${pkgver//\./_}_multi_language"

source=(
  "${_srcdir}.tar.gz::https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=${_fileid}&tx_kmanacondaimport_downloadproxy[documentId]=${_documentid}&tx_kmanacondaimport_downloadproxy[system]=${_system}&tx_kmanacondaimport_downloadproxy[language]=${_lang}&type=${_type}"
  "LICENSE"
)
sha256sums=('6f635abe6c5b2fc2896d3575d535043881f1369cea71a3a94a009dbf3b8f5e7b'
            'a3dcdd6459b4a376c61ad8c69ced0f356581229b39b209debe1679749824c408')

package() {
  find ${_srcdir} -name "*.ppd" -exec install -Dpm644 {} -t "${pkgdir}/usr/share/cups/model/KonicaMinolta/" \;
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm755  ${_srcdir}/KMbeuEmpPS.pl -t "${pkgdir}/usr/lib/cups/filter/"
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
set +u
