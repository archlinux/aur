# Maintainer: suienzan <suienzan at gmail dot com>

_mplusver=20220319052552
pkgname=mplus-1-code-nerd-font
pkgdesc='M PLUS 1 Code Nerd Font'
pkgver=20220319052552.3.0.0
pkgrel=1
arch=('any')
license=('OFL')
url='https://mplusfonts.github.io/'

source=("Mplus1Code-Bold-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-Bold.ttf"
        "Mplus1Code-ExtraLight-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-ExtraLight.ttf"
        "Mplus1Code-Light-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-Light.ttf"
        "Mplus1Code-Medium-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-Medium.ttf"
        "Mplus1Code-Regular-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-Regular.ttf"
        "Mplus1Code-SemiBold-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-SemiBold.ttf"
        "Mplus1Code-Thin-$_mplusver.ttf::https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/Mplus1Code-Thin.ttf"
        "OFL-$_mplusver.txt::https://raw.githubusercontent.com/coz-m/MPLUS_FONTS/master/OFL.txt"
        "FontPatcher-v3.0.0.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FontPatcher.zip")
sha256sums=('a7067056ec7a69f81812527e232ec9e57c28c3c01f897655a45937cebfd23d91'
            '507979a891f2d4d249e1249bacb53a89dda87e1cd699cef005857d79e711f643'
            '45c83fd3f9a5a6d07a4bbfd631e9e86559867bd4aa88cf81c334939ae06c316c'
            'b2ce90cf4f963ee01ba0cfbf9e51f3d989ef9de45aeaca1089040ff406770a5d'
            '1986ac8f6cd99272c117a0cdb6e5ee0b150373030e050016ac1bc70a195f66da'
            'f0e5bc8fd48a04e3203cb9ac73d431a4657275d128f452606f965506a02830ab'
            '59879e4c95eef7202031f3618d5cfac67e590f03341c1105157f072fd04975bf'
            '04971e3fcee60b247395150d93b3616f6a0b092572332c96187b472976553abc'
            '4239d7c6eb21387a41821ce8b7d00311817b40cbec2b2c6c18ff20f8217eb38c')
makedepends=('fontforge')
provides=("mplus-1-code")

build() {
  # set familyname
  sed -i 's/familyname = fontname/familyname = "M PLUS 1 Code"/g' ${srcdir}/font-patcher
  for f in ${srcdir}/Mplus1Code-*; do
    [[ -e "$f" ]] || break
    fontforge -script font-patcher "$f" -c -out dist
  done
}

package() {
  install -dm555 ${pkgdir}/usr/share/fonts/${pkgname}
  install -m444 dist/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}
  install -D -m644 OFL-$_mplusver.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
