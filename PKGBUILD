# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-bluetooth-git
_pkgname=bluetooth
pkgver=r1.c0f813e
pkgrel=1
provides=(astal-bluetooth libastal-bluetooth libastal-bluetooth.so=0-64)
pkgdesc="library to control bluez over dbus "
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/bluetooth"
depends=(
  glib2
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

