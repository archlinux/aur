# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=ttf-mathtype
pkgver=6.9
pkgrel=1
pkgdesc="Fonts supplied with MathType"
url="http://www.dessci.com/en/dl/fonts/"
depends=('fontconfig' 'xorg-font-utils')
makedepends=('cabextract')
arch=('any')
license=('custom')
install=ttf.install
source=("http://www.dessci.com/en/dl/DS_Fonts_${pkgver}_(TT).exe"
        "http://www.dessci.com/en/dl/DS_Fonts_${pkgver}_(PS).exe"
        'license.txt')
noextract=("DS_Fonts_${pkgver}_(TT).exe"
           "DS_Fonts_${pkgver}_(PS).exe")
md5sums=('cfd1577b68103fd8479a2561aa3f7d0c'
         '26b94334992529dd9000b3c491245526'
         '662f7c87498d513571148913ae09313b')

prepare() {
  mkdir -p "${srcdir}/fonts/ttf"
  cd "${srcdir}/fonts/ttf"
  cabextract "${srcdir}/DS_Fonts_${pkgver}_(TT).exe"

  mkdir -p "${srcdir}/fonts/ps"
  cd "${srcdir}/fonts/ps"
  cabextract "${srcdir}/DS_Fonts_${pkgver}_(PS).exe"
}

package() {
  # Install TrueType fonts
  cd "${srcdir}/fonts/ttf"
  install -d -m755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  # Install Type1 fonts
  cd "${srcdir}/fonts/ps"
  install -d -m755 "${pkgdir}/usr/share/fonts/Type1"
  install -m644 *.afm *.pfb *.pfm "${pkgdir}/usr/share/fonts/Type1/"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
