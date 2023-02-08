# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>
# Contributor: Guillaume Dolle <dolle.guillaume@gmail.com>
_driver='c368-series'
_fileid='79da0f659ac2191cf88560aee21df50d'
_documentid='128230'
_type='1558521685'
_system='KonicaMinolta'
_lang='EN'

pkgname=konica-minolta-bizhub-c368-series
pkgver=1.24
pkgrel=1
pkgdesc='CUPS PostScript printer driver for bizhub (423 4750 4752 5020I 554E 652 750I 754 C35 C360 C360I C368 C3850 C3851 C650I C652D C658 C754 C759 WPH)'
arch=('any')
url='https://www.konicaminolta.eu/en/business-solutions/support/download-center.html'
license=('custom:konica minolta commercial license')
depends=('cups')
makedepends=('gzip')
_srcdir="KMbeuUXv${pkgver//\./_}_multi_language"

source=("${_srcdir}.tar.gz::https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=${_fileid}&tx_kmanacondaimport_downloadproxy[documentId]=${_documentid}&tx_kmanacondaimport_downloadproxy[system]=${_system}&tx_kmanacondaimport_downloadproxy[language]=${_lang}&type=${_type}")
sha256sums=('06d08276b94121ee17b8885fbbbab6c464ec40daf6c144962ddf6ac1eb712e09') #if the download fails, please download the file manually

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
