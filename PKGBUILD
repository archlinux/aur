# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=quarrel-git
_pkgname=quarrel
pkgver=r869.9d0d482
pkgrel=1
provides=(libquarrel.so=0-64)
pkgdesc="Lib for command line argument parsing."
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
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

