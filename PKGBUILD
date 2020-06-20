# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flatery-icon-theme-git
pkgver=r128.d772f71
pkgrel=1
pkgdesc='Flatery is an icon theme for linux in flat style'
arch=('any')
url='https://github.com/cbrnix/Flatery'
license=('CCPL')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
makedepends=('git')
source=("flatery-icon-theme::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/flatery-icon-theme"
  ( 
   set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/flatery-icon-theme/Flatery"
  install -dm755 "${pkgdir}/usr/share/icons/Flatery"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Flatery"
  cd "$srcdir/flatery-icon-theme/Flatery-Dark"
  install -dm755 "${pkgdir}/usr/share/icons/Flatery-Dark"
  cp -drf --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Flatery-Dark"
  cd "${pkgdir}/usr/share/icons/Flatery-Dark"
  rm License-CC_BY-NC-SA_3.0-Legal.pdf License-CC_BY-NC-SA_3.0-Summary.pdf README.md
  cd "${pkgdir}/usr/share/icons/Flatery"
  rm License-CC_BY-NC-SA_3.0-Legal.pdf License-CC_BY-NC-SA_3.0-Summary.pdf README.md cover.png
}
# vim:set ts=2 sw=2 et: