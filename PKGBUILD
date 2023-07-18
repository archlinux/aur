# Maintainer: hrdl <aur@hrdl.eu>
# Contributor: danb (danb) <danb (at) hasi.it>

pkgname=avizo-git
_pkgname=avizo
pkgver=r93.9cd5319
pkgrel=1
pkgdesc="A neat notification daemon"
arch=("x86_64")
url="https://github.com/misterdanb/avizo"
license=("GPL")
depends=(
  "alsa-utils"
  "dbus"
  "gobject-introspection"
  "gtk-layer-shell"
  "gtk3"
)
optdepends=(
  "brightnessctl: for helper script lightctl"
  "light: for helper script lightctl"
  "pamixer: for helper script volumectl"
)
makedepends=(
  "git"
  "vala"
  "meson"
  "ninja"
)
provides=('avizo')
conflicts=('avizo')

source=("$_pkgname::git+https://github.com/misterdanb/avizo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$_pkgname"

  meson test -C build
}

package() {
  cd "$_pkgname"

  meson install -C build --destdir "$pkgdir"
}
