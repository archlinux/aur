# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kuyen-icon-theme-git
pkgver=r6.dc96d33
pkgrel=1
pkgdesc="A colourful flat theme designed for Plasma desktop"
arch=('any')
url='https://www.opencode.net/fabianalexis/kuyen-icons'
license=('CCPL')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
makedepends=('git')
source=("kuyen-icon-theme::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/kuyen-icon-theme"
  ( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/kuyen-icon-theme"
  rm *.md
  rm -rf .git
}

package() {
  cd "${srcdir}"
  install -dm 755 "${pkgdir}/usr/share/icons/"
  cp -drf --no-preserve='ownership' . "${pkgdir}/usr/share/icons/"
}
# vim:set ts=2 sw=2 et: