# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Old Maintainer: javier dot tia at gmail dot com
# Older Maintainer: onestone at gmail dot com

pkgname=ttf-nerd-fonts-input
pkgver=20170404
nerdfont_ver=2.0.0
pkgrel=3
pkgdesc='Fonts for Code, from Font Bureau, patched with nerd-fonts'
arch=('any')
url='http://input.fontbureau.com/'
license=('custom:Font Software License Agreement')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('fontforge')
url_long="${url}build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email="
# go to the input website and try a download to get more info on how to customise this URL. Below are the setting I personally use, the default above matches the ttf-input package (all defaults on the website)
# url_long="${url}build/?fontSelection=whole&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=0&asterisk=height&braces=0&preset=default&line-height=1.2&accept=I+do&email="
source=("Input_Fonts_${pkgver}.zip::${url_long}"
        "https://github.com/ryanoasis/nerd-fonts/archive/v${nerdfont_ver}.tar.gz")
sha256sums=('18c69fbe80ed468dbd8445074bd696eb316f0b9102db3bc59a4f89b0d6f6d31d'
            '0d5939042eff3b2d9b81ee2a871b3d2c046cbc6781f20ae87cdecfc1833e7bc8')



package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  find ${srcdir}/Input_Fonts -name '*.ttf' \
       -exec fontforge -script ${srcdir}/nerd-fonts-${nerdfont_ver}/font-patcher \
       --no-progressbars --careful \
       --complete --outputdir \
       ${pkgdir}/usr/share/fonts/TTF {} \;
  chmod 644 ${pkgdir}/usr/share/fonts/TTF/*

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
