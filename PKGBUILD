# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ttf-roboto-slab
pkgver=1.100263
pkgrel=3
pkgdesc='Serif Roboto font from Google Keep'
arch=('any')
license=('APACHE')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')

_path='https://googlefontdirectory.googlecode.com/hg/apache/robotoslab'
_rev='f7e52be013a41d64a5f5105ab0e1d82fc3e48478'
source=(
  "${_path}/LICENSE.txt?r=${_rev}"
  "${_path}/RobotoSlab-Bold.ttf?r=${_rev}"
  "${_path}/RobotoSlab-Light.ttf?r=${_rev}"
  "${_path}/RobotoSlab-Regular.ttf?r=${_rev}"
  "${_path}/RobotoSlab-Thin.ttf?r=${_rev}"
)

md5sums=(
  '3b83ef96387f14655fc854ddc3c6bd57'
  'd63ef23299458362f3edbf6cd8c2c510'
  '79754934891c17dd798ca5e7eb5fa9a9'
  '1ec06eed11bbcb1ee510b8f3522adea8'
  '317a4210ef29a41c456503c8e5951448'
)

install=${pkgname}.install

prepare() {
  for SRCFILE in "${srcdir}"/*; do
    WOREV="${SRCFILE%?r=${_rev}}"
    if [ "${SRCFILE}" != "${WOREV}" ]; then
      mv "${SRCFILE}" "${WOREV}"
    fi
  done
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
