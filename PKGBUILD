# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>
pkgname=cmmk_ctrl-git
_pkgname=cmmk_ctrl
pkgver=r8.34532c4
pkgrel=1
pkgdesc="Qt based RGB control application for MasterKeys devices"
arch=(i686 x86_64)
url="https://github.com/chmod222/cmmk_ctrl"
license=('GPL')
depends=(libcmmk qt5-base qt5-svg)
source=("git+https://github.com/chmod222/cmmk_ctrl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX="/usr" cmmk_ctrl
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="/usr" INSTALL_ROOT="$pkgdir/" install

  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 "README.md" "$pkgdir/usr/share/doc/$_pkgname"
}
# vim: set ts=2 sw=2 et:
