# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Old Maintainer: javier dot tia at gmail dot com
# Older Maintainer: onestone at gmail dot com

pkgname=ttf-nerd-fonts-input
epoch=1
pkgver=3.1.1
pkgrel=1
pkgdesc='Fonts for Code, from Font Bureau, patched with nerd-fonts'
arch=('any')
url='http://input.djr.com/'
license=('custom:Font Software License Agreement')
makedepends=('fontforge' 'parallel')
url_long="${url}build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email="
# go to the input website and try a download to get more info on how to customise this URL. Below are the setting I personally use, the default above matches the ttf-input package (all defaults on the website)
# url_long="${url}build/?fontSelection=whole&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=0&asterisk=height&braces=0&preset=default&line-height=1.2&accept=I+do&email="
source=("Input_Fonts.zip::${url_long}"
        "https://github.com/ryanoasis/nerd-fonts/archive/v${pkgver}.tar.gz")
sha256sums=('7f225b412d95231fdb2c4ec8251e9a25abf6661f065525c943a35ba6eb51bf10'
            '4c4d7f2aceda05ff17789adb2c7046972f4729bc785bc85fd08d0ffde8785e5f')

build () {
  mkdir -p ${srcdir}/TTF
  find ${srcdir}/Input_Fonts -name '*.ttf' \
       | parallel fontforge -script ${srcdir}/nerd-fonts-${pkgver}/font-patcher \
       --no-progressbars --careful \
       --complete --outputdir \
       ${srcdir}/TTF {} \;
}

package() {
    mkdir -p ${pkgdir}/usr/share/fonts/TTF
    cp -r ${srcdir}/TTF/* ${pkgdir}/usr/share/fonts/TTF
    chmod 644 ${pkgdir}/usr/share/fonts/TTF/*

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    cp ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
