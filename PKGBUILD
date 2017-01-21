# Maintainer: <RushAur> <nojunkmails at t-online dot de>
# Surfn icons from <https://github.com/erikdubois/Surfn> 
pkgname=rainbow-icons-git
pkgver=r240.11dc2b81
pkgrel=1
pkgdesc="A customized multi-colour icon theme."
arch=('any')
url="https://github.com/0devnull0/rainbow-icons"
license=('CC BY-NC-SA 4.0')
makedepends=('git')
conflicts=(surfn-icons-git menda-circle-icon-theme-git breeze-icons breeze-icons-git)
provides=(surfn-icons-git breeze-icons)
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
  install -m744 'breeze/LICENSE' "${pkgdir}"/usr/share/licenses/"${pkgname}"/breeze-icons-LICENSE
  install -m744 \
    'Menda-Circle/LICENSE' "${pkgdir}"/usr/share/licenses/"${pkgname}"/Menda-Circle-LICENSE
  cp $_cp_args 'breeze' "${pkgdir}"/usr/share/icons/
  cp $_cp_args 'breeze-dark' "${pkgdir}"/usr/share/icons/
  cp $_cp_args 'Menda-Circle' "${pkgdir}"/usr/share/icons/
  cp $_cp_args 'Surfn' "${pkgdir}"/usr/share/icons
  find "${pkgdir}"/usr/share/icons/ -maxdepth 2 -type f -name "*LICENSE*" -exec rm "{}" \;
}
# vim:set ft=sh ts=2 sw=2 et:
