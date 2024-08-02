# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-river-git
_pkgname=river
pkgver=r12.0a8a39d
pkgrel=1
provides=(astal-river libastal-river libastal-river.so=0-64)
pkgdesc="a library and cli tool for getting status information of the river wayland compositor. "
arch=(x86_64)
license=(LGPL-2.1-only)
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
groups=("libastal")
source=("git+${url}.git")
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

