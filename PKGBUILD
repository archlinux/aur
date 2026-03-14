# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-wl-git
_pkgname=wl
pkgver=r859.8b39f46
pkgrel=1
provides=(astal-wl libastal-wl libastal-wl.so=0-64)
pkgdesc="Provides a central lib to manage wayland objects for other astal libs"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  wayland
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
  wl-vapi-gen
)
groups=("libastal")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lib/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

