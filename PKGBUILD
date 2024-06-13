# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-river-git
_pkgname=river
pkgver=r2.b6ba3c7
pkgrel=1
provides=(astal-river libastal-river libastal-river.so=0-64)
pkgdesc="a library and cli tool for getting status information of the river wayland compositor. "
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/river"
depends=(
  glib2
  glibc
  wayland
  json-glib
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "$pkgdir"
}

