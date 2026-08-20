# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=stamp
pkgver=0r300+9f9777b
pkgrel=1
pkgdesc="A modern personal information management application"
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
  gpgme
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

source=("git+https://gitlab.gnome.org/jbrummer/stamp.git#commit=9f9777b71d1919b17ed1c8040c9c60ed0d325ba3")
sha256sums=('2475b84f4b3c3e261c9f03f45d3ca731525f81038bf61aab44151602d354854c')

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
