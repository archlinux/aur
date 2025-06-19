# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-powerprofiles-git
_pkgname=powerprofiles
pkgver=r786.ca3190d
pkgrel=2
provides=(astal-power-profiles libastal-power-profiles libastal-power-profiles.so=0-64)
pkgdesc="Library and cli to control upowerd powerprofiles"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
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

