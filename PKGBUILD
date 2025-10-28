# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-git
pkgname=("libastal-git")
_pkgname=libastal
pkgver=r849.189bf73
pkgrel=2
pkgdesc="Building blocks for building desktop shells."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "wayland" "wayland-protocols"
  "gobject-introspection" "meson" "vala")
depends=("glib2" "glibc" "gtk3" "gtk-layer-shell" "gdk-pixbuf2" "wayland")
provides=(libastal libastal.so=3-64)
groups=("libastal")
source=("git+${url}.git")
sha256sums=("SKIP")
_rockname=astal-dev-1.rockspec

pkgver(){
  cd astal
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lib/astal/gtk3
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/astal/gtk3
  meson install -C build --destdir "$pkgdir"
}

