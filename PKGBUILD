# Maintainer: Nicholas Wang <me at nicho1as dot wang>

_pkgbase=libbestline
pkgname=libbestline-git
pkgver=r41.5a0bc4b
pkgrel=2
pkgdesc="ANSI Standard X3.64 Teletypewriter Command Session Library"
url="https://github.com/jart/bestline"
arch=('any')
license=('BSD-2-Clause')
provides=("libbestline.so" "libbestline")
makedepends=('git')
source=("libbestline::git+https://github.com/jart/bestline.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/libbestline"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build () {
  export cc="gcc"
  cd "$srcdir/libbestline"
  make libbestline.so
}

package () {
  cd "$srcdir/libbestline"
  install -Dm755 libbestline.so -t "${pkgdir}/usr/lib/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/libbestline/"
  install -Dm644 bestline.h -t "${pkgdir}/usr/include/"
}
