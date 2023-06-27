# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname="gnome-weather"
pkgname="${_pkgname}-git"
pkgver=44.0+20+g741d71c
pkgrel=1
pkgdesc="Access current weather conditions and forecasts"
url="https://wiki.gnome.org/Apps/Weather"
arch=(any)
license=(GPL)
depends=(
  geoclue
  gjs
  gtk4
  libadwaita
  libgweather-4
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=(
  gnome
  gnome-git
)
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
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
