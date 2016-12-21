# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-caliburn
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Caliburn font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('dos2unix' 'glibc')
groups=('ttf-xo-fonts')
source=("XO_Caliburn-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Caliburn.zip")
sha256sums=('96d1210bca136f37d152cd7aeffc574a9aa73367aa24ce49d9e1cf3a86944d24')
install=${pkgname}.install

prepare() {
  iconv -f cp1251 -t utf8 -o LICENSE XO_Fonts_License.txt
  dos2unix LICENSE
}

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
