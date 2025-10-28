# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=("libastal-4-git")
pkgver=r849.189bf73
pkgrel=1
pkgdesc="Building blocks for building desktop shells using gtk4."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "gobject-introspection" "meson" "vala")
depends=("glib2" "glibc" "gtk4" "gtk4-layer-shell" "gdk-pixbuf2" "wayland")
provides=(libastal-4 libastal-4.so=4-64)
groups=("libastal")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
  cd astal
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lib/astal/gtk4
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/astal/gtk4
  meson install -C build --destdir "$pkgdir"
}

