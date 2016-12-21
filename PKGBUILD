# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-oriel-condensed
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Oriel Condensed font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('dos2unix' 'glibc')
groups=('ttf-xo-fonts')
source=("XO_Oriel_Condensed-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Oriel_Condensed.zip")
sha256sums=('671c76493faad648e799b88686652d5f8adeec7c8fbe379dc4b49d8749c70243')
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
