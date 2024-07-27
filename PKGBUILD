# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=glib-networking
pkgver=2.80.0
pkgrel=3
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
b2sums=('819f574bd8e43e24e3e4c2248a44bb4882aa402c0c8c836b1d054b7d7da0d7f17428c64f8192185fa86575cf431ce895071b5ae22f26feea3c19ec7e5b74251d')

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
