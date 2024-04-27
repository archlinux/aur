# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Pellegrino Prevete(tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname="gnome-tweaks"
pkgname="${_pkgname}-git"
pkgver=46.0.r14.g5c0aea3
pkgrel=1
pkgdesc="Graphical interface for advanced GNOME 3 settings (Tweak Tool)"
url="https://wiki.gnome.org/Apps/Tweaks"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gnome-desktop-4
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  libadwaita
  libgudev
  libnotify
  pango
  python
  python-gobject
)
makedepends=(
  git
  meson
)
groups=(
  gnome-extra
  gnome-extra-git
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
