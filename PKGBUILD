# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Old Maintainer: javier dot tia at gmail dot com
# Older Maintainer: onestone at gmail dot com

pkgname=ttf-nerd-fonts-input
pkgver=20170404
pkgrel=1
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
        "https://github.com/ryanoasis/nerd-fonts/archive/v1.2.0.tar.gz")
sha256sums=('18c69fbe80ed468dbd8445074bd696eb316f0b9102db3bc59a4f89b0d6f6d31d'
            'c440409b76c86dc4a88be3d9ab5fb04092a176e6ff15ff2a61edc00861df0c2d')

package() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  find ${srcdir}/Input_Fonts -name '*.ttf' \
       -exec fontforge -script ${srcdir}/nerd-fonts-1.2.0/font-patcher \
       --no-progressbars --careful \
       --complete --outputdir \
       ${pkgdir}/usr/share/fonts/TTF {} \;
  chmod 644 ${pkgdir}/usr/share/fonts/TTF/*

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
