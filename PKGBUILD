# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=stamp-git
pkgver=0r237+4116482
pkgrel=1
pkgdesc="PIM Suite"
url="https://gitlab.gnome.org/jbrummer/stamp"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  evolution-data-server
  glib2
  glibc
  gnome-control-center
  gnome-online-accounts
  graphene
  gstreamer
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  libedataserverui4
  libgcc
  libical
  libportal
  libportal-gtk4
  libpsl
  libsoup3
  nss
  webkitgtk-6.0
)
makedepends=(
  appstream
  blueprint-compiler
  git
  glib2-devel
  meson
)
conflicts=(stamp)
provides=(stamp)

source=("git+https://gitlab.gnome.org/jbrummer/stamp.git")
b2sums=('SKIP')

pkgver() {
  cd stamp
  printf "0r$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
}

build() {
  arch-meson stamp build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
