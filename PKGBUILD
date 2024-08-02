# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-wireplumber-git
_pkgname=wireplumber
pkgver=r11.8f3eca7
pkgrel=1
provides=(astal-wireplumber libastal-wireplumber libastal-wireplumber.so=0-64)
pkgdesc="A library for audio control using wireplumber"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/astal-sh/wireplumber"
depends=(
  glib2
  glibc
  libwireplumber
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

