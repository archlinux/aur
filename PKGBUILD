# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-windy
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Windy font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('dos2unix' 'glibc')
groups=('ttf-xo-fonts')
source=("XO_Windy-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Windy.zip")
sha256sums=('91a59761849594ef392adb280012372e24d216bf8cfc4af2787d9cb47937bd47')
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
