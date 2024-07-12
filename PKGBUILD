# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-powerprofiles-git
_pkgname=powerprofiles
pkgver=r2.c3c807c
pkgrel=1
provides=(astal-powerprofiles libastal-powerprofiles libastal-powerprofiles.so=0-64)
pkgdesc="Library and cli to control upowerd powerprofiles"
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/powerprofiles"
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

