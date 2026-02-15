# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Updated by Andrew Rembrandt <andrew@rembrandt.dev> to point to master branch

_pkgname=gnome-logs
pkgname=$_pkgname-git
pkgver=49.0+11+gd3d2ecc
pkgrel=1
pkgdesc="A log viewer for the systemd journal"
url="https://apps.gnome.org/Logs"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
  dconf
  gcc-libs
  glib2
  glibc
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  libadwaita
  pango
  systemd
  systemd-libs
)
makedepends=(
  appstream
  git
  glib2-devel
  meson
  yelp-tools
)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-logs.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^gnome-logs-//;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  local meson_options=(
    -D man=true
  )

  arch-meson $_pkgname build -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
