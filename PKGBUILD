# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=glib-networking
pkgver=2.80.1
pkgrel=1
epoch=1
pkgdesc="Network extensions for GLib"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  glibc
  gnutls
  gsettings-system-schemas
  libproxy
)
makedepends=(
  git
  gsettings-desktop-schemas
  meson
)
checkdepends=(ca-certificates)
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${pkgver/[a-z]/.&}")
b2sums=('fcaacb1c1d29d38c59fb17f7c8821b6ed7f46f60751d9d6d8484a73b86e0614499aded8e49e27de2e68e775720cb0fc59daf2d995eebb8ac3606d4bb4854a123')

prepare() {
  cd glib-networking
}

build() {
  arch-meson glib-networking build
  meson compile -C build
}

check() {
  meson test -vC build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
