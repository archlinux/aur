# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-apps-git
_pkgname=apps
pkgver=r8.6550543
pkgrel=1
provides=(astal-apps libastal-apps libastal-apps.so=0-64)
pkgdesc="Library and cli tool for querying applications."
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/apps"
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

