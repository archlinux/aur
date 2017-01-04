# Maintainer: <RushAur> <nojunkmails at t-online dot de>
# Forked from surfn-icons-git. 
pkgname=rainbow-icons-git
pkgver=r230.ad3e79cf
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
  install -dm 755 "${pkgdir}"/usr/share/icons
  install -dm 755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m744 'Surfn/LICENSE.txt' "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -m744 'Menda Circle/LICENSE' "${pkgdir}"/usr/share/licenses/"${pkgname}"/Menda-Circle-LICENSE
  cp -dr --no-preserve='ownership' 'Surfn' "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' 'Surfn Orange' "${pkgdir}"/usr/share/icons/Surfn-Orange
  cp -dr --no-preserve='ownership' 'Surfn Majestic' "${pkgdir}"/usr/share/icons/Surfn-Majestic
  cp -dr --no-preserve='ownership' 'Surfn Arch Blue' "${pkgdir}"/usr/share/icons/Surfn-Arch-Blue
  cp -dr --no-preserve='ownership' 'Menda Circle' "${pkgdir}"/usr/share/icons/Menda-Circle
  cp -dr --no-preserve='ownership' 'Surfn Breeze Dark' "${pkgdir}"/usr/share/icons/Surfn-Breeze-Dark
  find "${pkgdir}"/usr/share/icons/ -maxdepth 2 -type f -name "*LICENSE*" -exec rm "{}" \;
}
# vim:set ft=sh ts=2 sw=2 et:
