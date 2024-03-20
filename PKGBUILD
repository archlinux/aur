# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.80.0
pkgrel=1
epoch=1
pkgdesc="Network extensions for GLib (32-bit)"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib-networking
  lib32-glib2
  lib32-glibc
  lib32-gnutls
  lib32-libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(ca-certificates)
_commit=3ae624d21b586ec33543004b037fd343042cb04b  # tags/2.80.0^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd glib-networking
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib-networking
}

build() {
  arch-meson glib-networking build --cross-file lib32
  meson compile -C build
}

check() {
  meson test -vC build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir"/usr/{lib,share}
}

# vim:set sw=2 sts=-1 et:
