# Maintainer: RushAur <nojunkmails at t-online dot de>
pkgname=rainbow-icons-git
pkgver=r226.97ed002b
pkgrel=1
pkgdesc="A multicolour icon theme based on Surfn-icons-git."
arch=('any')
url="https://github.com/0devnull0/Surfn"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=(surfn-icons-git)
conflicts=(menda-circle-icon-theme-git surfn-icons-git)
options=(!strip !emptydirs)
source=('Surfn::git+https://github.com/0devnull0/Surfn.git')
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
     msg "The breeze icons seems to be already installed on your System."
     while true; do 
     msg "Include it anyway? (y/N):"
     read choice
     case "$choice" in
         y|Y|yes) msg "OK, it will be included!"
         cp -dr --no-preserve='ownership' 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/
         break;;
         n|N|no|"") msg "OK, SKIPPED!"
         break;;
         *) msg "Nope '(°_°)'";;
     esac
     done 

  fi   
}
# vim:set ft=sh ts=2 sw=2 et:
