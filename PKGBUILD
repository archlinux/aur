# Maintainer: suienzan <suienzan at gmail dot com>

pkgname=mplus-1-code-nerd-font
pkgdesc='M PLUS 1 Code Nerd Font'
pkgver=20220720
pkgrel=1
arch=('any')
license=('OFL')
url='https://mplusfonts.github.io/'
source=("M_PLUS_1_Code-${pkgver}.zip::https://fonts.google.com/download?family=M%20PLUS%201%20Code"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/FontPatcher.zip"
        "https://raw.githubusercontent.com/coz-m/MPLUS_FONTS/master/OFL.txt")
sha256sums=('SKIP'
            '69df3545b86dbea1702b9ec078920211463ebe0d30a3c693d616f24112796914'
            '04971e3fcee60b247395150d93b3616f6a0b092572332c96187b472976553abc')
makedepends=('fontforge')
provides=("mplus-1-code")

build() {
  # set familyname
  sed -i 's/familyname = fontname/familyname = "M PLUS 1 Code"/g' ${srcdir}/font-patcher
  for f in ${srcdir}/static/*; do
    [[ -e "$f" ]] || break
    fontforge -script font-patcher "$f" -c -out dist
  done
}

pkgver() {
  date +%Y%m%d
}

package() {
  ls ${srcdir}/dist/

  echo ${pkgdir}

  install -dm555 ${pkgdir}/usr/share/fonts/${pkgname}
  install -m444 dist/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
