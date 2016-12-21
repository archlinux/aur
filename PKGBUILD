# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-tahion
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Tahion font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('dos2unix' 'glibc')
source=("XO_Tahion-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Tahion.zip")
sha256sums=('70c10e31caeb5a2006527d8005f96ca38dd3ddabe30b7829dfed5a02c290b1c1')
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
