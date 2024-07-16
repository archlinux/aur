# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-mpris-git
_pkgname=mpris
pkgver=r7.ce7152d
pkgrel=1
provides=(astal-mpris libastal-mpris libastal-mpris.so=0-64)
pkgdesc="Library and cli tool for controlling media players"
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/mpris"
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
groups=("libastal")
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

