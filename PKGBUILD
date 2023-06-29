# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname="gnome-maps"
pkgname="${_pkgname}-git"
pkgver=44.0+90+g4f3f61b8
pkgrel=1
pkgdesc="A simple GNOME 3 maps application"
url="https://wiki.gnome.org/Apps/Maps"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
license=(GPL)
depends=(
  geoclue
  geocode-glib-2
  gjs
  gtk4
  libadwaita
  libgweather-4
  librest
  libshumate
  libxml2
)
makedepends=(
  git
  gobject-introspection
  meson
  yelp-tools
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=("gnome" "gnome-git")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
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
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
