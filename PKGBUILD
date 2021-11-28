# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>

pkgname='konica-minolta-bizhub-c554e-series'
epoch=1
pkgver='1.24'
pkgrel=1
pkgdesc='CUPS PostScript driver for KONICA MINOLTA bizhub C554e Series (C554e/C454e/C364e/C284e/C224e)'
url="https://www.konicaminolta.eu/eu-en/support/download-centre"
arch=("any")
license=('custom:konica minolta commercial license')
depends=(
  'cups'
  'perl'
)
install="${pkgname}.install"
_distdir="KMbeuUXv${pkgver//./_}_multi_language"
source=(
  "KMbeuUXv${pkgver//./_}_multi_language.tar.gz::https://dl.konicaminolta.eu/de?tx_kmanacondaimport_downloadproxy[fileId]=79da0f659ac2191cf88560aee21df50d&tx_kmanacondaimport_downloadproxy[documentId]=128230&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=DE&type=1558521685"
  'LICENSE'
)
sha512sums=('f07c0d33f14646851f044f2b3833c3ffaf42259515c403a271731e3f5585f224d4794372b44f85fb38237eba0240c704aebd6e5455442f2c960984003a2c87c1'
            '95f5ceb1406e689c840411cef8f7803d9be6829c75a6eb8474ad3a1374ffca68db06cd56cf782578c02b2f7f3b190bb76f99f01e38a18254d7f0a6fbb48159f4')

package() {
  cd "$srcdir"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ppdmodel="${pkgdir}/usr/share/cups/model"

  # PPD for C224/C284/C364/C224e/C284e/C364e
  install -D -m 644 "${_distdir}/KMbeuC364ux.ppd" "${ppdmodel}/KMbeuC364ux.ppd"

  # PPD for C554/C454/C554e/C454e
  install -D -m 644 "${_distdir}/KMbeuC554ux.ppd" "${ppdmodel}/KMbeuC554ux.ppd"

  filter="${pkgdir}/usr/lib/cups/filter"

  # CUPS filter for encryption
  install -D -m 755 "${_distdir}/KMbeuEmpPS.pl" "${filter}/KMbeuEmpPS.pl"
  install -D -m 755 "${_distdir}/KMbeuEnc.pm" "${filter}/KMbeuEnc.pm"
}
