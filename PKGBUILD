# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=gnome-chess
pkgname="${_pkgname}-git"
pkgver=43.2+6+g389df74
pkgrel=1
pkgdesc="Play the classic two-player boardgame of chess"
url="https://wiki.gnome.org/Apps/Chess"
arch=(x86_64)
license=(GPL)
depends=(
  gtk4
  libadwaita
  librsvg
)
makedepends=(
  git
  gobject-introspection
  meson
  vala
  yelp-tools
)
optdepends=(
  'gnuchess: Play against computer')
groups=(gnome-extra gnome-extra-git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
