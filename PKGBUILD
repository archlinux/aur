# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Old Maintainer: javier dot tia at gmail dot com
# Older Maintainer: onestone at gmail dot com

pkgname=ttf-nerd-fonts-input
pkgver=20170404
nerdfont_ver=2.1.0
pkgrel=4
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
sha256sums=('6bdc29a3d727147041689ab52bf73c315dbecaa6e5393f8f662dfe7d94e82a83'
            'a084ca91a174b547bab4523507824c76aa91ebcf38f9256a4ffd181813f87bd8')

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
