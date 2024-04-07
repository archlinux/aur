# Maintainer: Mingi Sung <me@saltyming.pe.kr>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-calculator-git
_pkgname=gnome-calculator
pkgver=46.0+r18+g59fc6172
pkgrel=1
pkgdesc="GNOME Scientific calculator - git"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(
  x86_64
  i686
  aarch64
  armv7h
)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  glibc
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita-git
  libgee
  libmpc
  libsoup3
  libxml2
  mpfr
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
provides=(
  gnome-calculator
  libgcalc-2.so
  libgci-1.so
)
conflicts=(gnome-calculator)
# options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/gnome-calculator.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
