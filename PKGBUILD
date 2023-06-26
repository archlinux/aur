# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>
# Maintainer: austreanlocal <markus [dot] rottler [dot] kufstein [at] gmail [dot] com>

pkgname='konica-minolta-bizhub-c554e-series'
epoch=1
pkgver='1.25'
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
  "KMbeuUXv${pkgver//./_}_multi_language.tar.gz::https://dl.konicaminolta.eu/de?tx_kmdownloadcentersite_downloadproxy[fileId]=951f83f68051fc0335ff27f72165fad5&tx_kmdownloadcentersite_downloadproxy[documentId]=138068&tx_kmdownloadcentersite_downloadproxy[system]=KonicaMinolta&tx_kmdownloadcentersite_downloadproxy[language]=DE&type=1558521685"
  'LICENSE'
)
sha512sums=('2753f3d72589994564e75e7f0514ce4cf81317b9887c49496e776a9e6331151eda56c371344fb6f38c0496b3f4a12631b8fb7c1c2de770095953d39fe664ed26'
            '0a2af3c51430b64d69583518abe75ba5d420c556cdb172fe8ca3c9c9dfb8005d300c875f9c88bc2e94024f0b67a84b91e20625bee31c40ee866ce152618943d1')

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
