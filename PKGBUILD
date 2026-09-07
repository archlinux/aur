# Maintainer: kotontrion <kotontrion@kotontrion.net>

pkgname=libastal-workspace-git
_pkgname=workspace
pkgver=r971.3a73801
pkgrel=1
provides=(astal-workspace libastal-workspace libastal-workspace.so=0-64)
pkgdesc="Library implementing the ext-workspace wayland protocol"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  json-glib
  libastal-wl
  quarrel
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

