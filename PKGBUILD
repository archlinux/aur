# Maintainer: Akrata
pkgname=ttf-ms-aptos-core
pkgver=20260812
#aptos=4.40
#webfonts=1.0
pkgrel=2
pkgdesc="Microsoft TTF: Aptos (new Office default), Arial, Times New Roman and other core fonts"
arch=('any')
url="https://learn.microsoft.com/en-us/typography/font-list/"
#url aptos="https://www.microsoft.com/en-us/download/details.aspx?id=106087"
#url core="https://www.freedesktop.org/software/fontconfig/webfonts/"
provides=('ttf-ms-fonts' 'ttf-aptos')
conflicts=('ttf-ms-fonts' 'ttf-aptos')
license=('custom:Microsoft')
source=('https://download.microsoft.com/download/8/6/0/860a94fa-7feb-44ef-ac79-c072d9113d69/Microsoft%20Aptos%20Fonts.zip'
  'https://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz')
sha256sums=('6528fd120e719a9f985e94214eca6887d1653b88456916a792a630b02e95b025'
  '38f055027988e68f3a35705eb6d698f51ca7af0e295b0813b0a86129b238720c')
makedepends=('cabextract')

prepare() {
  for exe in "${srcdir}"/msfonts/*.exe; do
    cabextract -L -F '*.ttf' "$exe"
  done
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
  install -Dm644 "${srcdir}/Microsoft Aptos Fonts EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-aptos.rtf"
  install -Dm644 "${srcdir}/msfonts/Licen.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-core.txt"
}
