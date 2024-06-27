# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-battery-git
_pkgname=battery
pkgver=r2.4f3cc1d
pkgrel=1
provides=(astal-battery libastal-battery libastal-battery.so=0-64)
pkgdesc="DBus proxy library for upower daemon"
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/battery"
depends=(
  glib2
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

