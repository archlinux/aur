# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-tray-git
_pkgname=tray
pkgver=r7.3486989
pkgrel=1
provides=(astal-tray libastal-tray libastal-tray.so=0-64)
pkgdesc="Library and cli tool for managing the systemtray."
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/tray"
depends=(
  glib2
  json-glib
  gtk3
  gdk-pixbuf2
  libdbusmenu-gtk3
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

