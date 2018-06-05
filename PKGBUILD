# Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=peppercarrot-fonts
pkgver=3.0
pkgrel=1
pkgdesc="Fonts required to correctly view and edit Pepper&Carrot SVGs"
arch=('any')
url="https://framagit.org/peppercarrot/webcomics/tree/master/fonts"
license=('GPL3' 'Apache' 'Custom:OFL10' 'Custom:OFL11' 'Custom:MITX11'
         'Custom:MplusFont' 'Custom:CCBY3')
depends=('fontconfig' 'xorg-font-utils'
         # Already packaged OTF fonts
         'otf-pecita' 'otf-yanone-kaffeesatz'
         # Already packaged TTF fonts
         'ttf-droid-nonlatin-ib' 'ttf-impallari-lobster-font' 'lohit-fonts')
conflicts=('peppercarrot-fonts-git')
provides=('peppercarrot-fonts-git')

source=("https://www.peppercarrot.com/0_sources/0ther/tools/zip/peppercarrot-fonts-$pkgver.zip")
sha256sums=('81cc7e146de4f83db3145e63e865377fdb22208737ea32b5f305da2cb393a45d')

package() {
  local i
  for i in "${srcdir}"/fonts/*/*; do
    filename=${i##*/}

    case "${filename,,}" in
      pecita*|yanonekaffeesatz*)  ;; # Already packaged OTF
      droidkufi*|lobster*|lohit*) ;; # Already packaged TTF

      *.otf)       install -Dm644 "${i}" \
                   "${pkgdir}/usr/share/fonts/OTF/${filename}"; ;;

      *.ttf|*.ttc) install -Dm644 "${i}" \
                   "${pkgdir}/usr/share/fonts/TTF/${filename}"; ;;

      *.copyright|*.license) install -Dm644 "$i" \
                             "${pkgdir}/usr/share/licenses/${pkgname}/${filename}"
    esac
  done
}

# vim:set tw=80 ts=2 sw=2 et:




