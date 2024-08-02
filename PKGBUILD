# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-battery-git
_pkgname=battery
pkgver=r5.bc436cc
pkgrel=1
provides=(astal-battery libastal-battery libastal-battery.so=0-64)
pkgdesc="DBus proxy library for upower daemon"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/astal-sh/battery"
depends=(
  glib2
  glibc
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

