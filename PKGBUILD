# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=drawing-git
pkgver=r134.b748831
pkgrel=1
pkgdesc="Drawing application for the GNOME desktop"
url="https://github.com/maoschanz/drawing"
arch=(any)
license=(GPL)
depends=(gtk3 python)
makedepends=(git meson python)
provides=(drawing com.github.maoschanz.Drawing)
conflicts=(drawing)
source=("git+https://github.com/maoschanz/drawing.git")
sha256sums=(SKIP)

pkgver() {
  cd drawing
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson drawing build
  ninja -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
