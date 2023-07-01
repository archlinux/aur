# Maintainer: redtide <redtid3@gmail.com>

_pkgname=labwc-tweaks
pkgname=$_pkgname-git
pkgver=r57.c52dc16
pkgrel=1
pkgdesc="Simple configuration GUI application for labwc"
url="https://github.com/labwc/labwc-tweaks"
license=(GPL2)
arch=(x86_64)
depends=(
  gtk3
  libxml2
  wayland
  wayland-protocols
)
makedepends=(
  meson
)
source=(
  $_pkgname::git+$url.git
)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
