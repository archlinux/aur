# Maintainer: <RushAur> <nojunkmails at t-online dot de>
# Forked from surfn-icons-git. 
pkgname=rainbow-icons-git
pkgver=r231.7962fb4c
pkgrel=1
pkgdesc="A customized multi-colour icon theme."
arch=('any')
url="https://github.com/0devnull0/rainbow-icons"
license=('CC BY-NC-SA 4.0')
makedepends=('git')
conflicts=(surfn-icons-git menda-circle-icon-theme-git)
provides=(surfn-icons-git)
options=(!strip !emptydirs)
source=('git+https://github.com/0devnull0/rainbow-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/rainbow-icons"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd rainbow-icons
  _cp_args="-dr --no-preserve=ownership"
  install -dm 755 "${pkgdir}"/usr/share/icons
  install -dm 755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m744 'Surfn/LICENSE.txt' "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -m744 \
    'Menda Circle/LICENSE' "${pkgdir}"/usr/share/licenses/"${pkgname}"/Menda-Circle-LICENSE
  cp $_cp_args 'Surfn' "${pkgdir}"/usr/share/icons
  cp $_cp_args 'Surfn Orange' "${pkgdir}"/usr/share/icons/Surfn-Orange
  cp $_cp_args 'Surfn Majestic' "${pkgdir}"/usr/share/icons/Surfn-Majestic
  cp $_cp_args 'Surfn Arch Blue' "${pkgdir}"/usr/share/icons/Surfn-Arch-Blue
  cp $_cp_args 'Menda Circle' "${pkgdir}"/usr/share/icons/Menda-Circle
# if test -d /usr/share/icons/breeze-dark/;then
#      msg "'Breeze-dark theme' is installed on your System. KDE users should have it installed."
#      msg "The one included in this theme is a bit 'fine tuned'."
#      msg "Both are co-installable and won't overwrite each other."
#      while true; do 
#      echo -n "Include it anyway? (Y/n): "
#      read choice
#      case "$choice" in
#          y|Y|yes|"") msg "OK, including it!"
#          cp $_cp_args 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/Surfn-Breeze-Dark
#          break;;
#          n|N|no|NO) msg "OK, SKIPPED!"
#          break;;
#          *) msg "Nope (°_°)";;
#      esac
#      done
#      else 
#          cp $_cp_args 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/Surfn-Breeze-Dark
#   fi  
  cp $_cp_args 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/Surfn-Breeze-Dark
  find "${pkgdir}"/usr/share/icons/ -maxdepth 2 -type f -name "*LICENSE*" -exec rm "{}" \;
}
# vim:set ft=sh ts=2 sw=2 et:
