# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>
# Contributor: Guillaume Dolle <dolle.guillaume@gmail.com>
_driver='c368-series'
_fileid='951f83f68051fc0335ff27f72165fad5'
_documentid='138068'
_type='1558521685'
_system='KonicaMinolta'
_lang='EN'

pkgname=konica-minolta-bizhub-c368-series
pkgver=1.25
pkgrel=1
pkgdesc='CUPS PostScript printer driver for bizhub (423 4750 4752 5020I 554E 652 750I 754 C35 C360 C360I C368 C3850 C3851 C650I C652D C658 C754 C759 WPH)'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_srcdir="KMbeuUXv${pkgver//\./_}_multi_language"

source=("${_srcdir}.tar.gz::https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=${_fileid}&tx_kmanacondaimport_downloadproxy[documentId]=${_documentid}&tx_kmanacondaimport_downloadproxy[system]=${_system}&tx_kmanacondaimport_downloadproxy[language]=${_lang}&type=${_type}")
sha256sums=('42ed9f69864fc58bf4c77cdcade775a34a2c7b8d4fad238c5c3b974a392b11bb') #if the download fails, please download the file manually:
#https://dl.konicaminolta.eu/en?tx_kmdownloadcentersite_downloadproxy[fileId]=951f83f68051fc0335ff27f72165fad5&tx_kmdownloadcentersite_downloadproxy[documentId]=138068&tx_kmdownloadcentersite_downloadproxy[system]=KonicaMinolta&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685

package() {
  cd $srcdir/$_srcdir
  mkdir -p ${pkgdir}/usr/share/cups/model/KonicaMinolta/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  mkdir -p ${pkgdir}/usr/lib/cups/filter/
  find . -name "*.ppd" -exec install -Dpm644 {} ${pkgdir}/usr/share/cups/model/KonicaMinolta/ \;
  gzip "${pkgdir}/usr/share/cups/model/KonicaMinolta"/*.ppd
  install -Dpm755  KMbeuEmpPS.pl ${pkgdir}/usr/lib/cups/filter/
  install -Dpm755  KMbeuEnc.pm ${pkgdir}/usr/lib/cups/filter/
  install -Dpm644 EULA.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
