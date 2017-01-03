# Maintainer: RushAur <nojunkmails at t-online dot de>
pkgname=rainbow-icons-git
pkgver=r226.97ed002b
pkgrel=3
pkgdesc="A multicolour icon theme based on Surfn-icons-git."
arch=('any')
url="https://github.com/0devnull0/Surfn"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
conflicts=(surfn-icons-git menda-circle-icon-theme-git)
provides=(surfn-icons-git)
options=(!strip !emptydirs)
source=('git+https://github.com/0devnull0/Surfn.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Surfn"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd Surfn
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' 'Surfn' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Orange' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Majestic' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Surfn Arch Blue' "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' 'Menda Circle' "${pkgdir}"/usr/share/icons/
  if test -d /usr/share/icons/breeze-dark/;then
     msg "'Breeze-dark theme' is installed on your System. KDE users should have it installed."
     msg "The one included in this theme is a bit 'fine tuned'."
     msg "Both are co-installable and won't overwrite each other."
     while true; do 
     echo -n "Include it anyway? (Y/n): "
     read choice
     case "$choice" in
         y|Y|yes|"") msg "OK, including it!"
         cp -dr --no-preserve='ownership' 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/
         break;;
         n|N|no|NO) msg "OK, SKIPPED!"
         break;;
         *) msg "Nope (°_°)";;
     esac
     done
     else 
         cp -dr --no-preserve='ownership' 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/
     
  fi   
}
# vim:set ft=sh ts=2 sw=2 et:
