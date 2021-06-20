# Maintainer: Kishore G <kishore96 at gmail dot com>

_name=sticky-window-snapping
pkgname=kwin-scripts-${_name}-git
pkgver=r69.a0d500d
pkgrel=1
pkgdesc="KWin script that makes window edges sticky while resizing."
arch=('any')
url="https://github.com/Flupp/sticky-window-snapping"
license=('GPL')
depends=('kwin')
makedepends=('git')
optdepends=()
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${pkgname}/package
  mkdir -p "$pkgdir"/usr/share/kwin/scripts
  mkdir -p "$pkgdir"/usr/share/kservices5
  plasmapkg2 --type KWin/Script --packageroot "$pkgdir"/usr/share/kwin/scripts --install .
  ln --symbolic "$pkgdir"/usr/share/kwin/scripts/sticky-window-snapping/metadata.desktop "$pkgdir"/usr/share/kservices5/kwin-script-sticky-window-snapping.desktop
}
