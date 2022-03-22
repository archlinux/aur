# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.72.0
pkgrel=1
pkgdesc="Network extensions for GLib (32-bit)"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(
  glib-networking
  lib32-glib2
  lib32-gnutls
  lib32-libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(
  ca-certificates
)
options=(debug)
_tag=e572a436031129bf3d376978d3e8b1f6f934a328
source=(git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd glib-networking

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  arch-meson glib-networking build --libdir=/usr/lib32
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -rf "${pkgdir}"/usr/{lib,share}
}

# vim:set ts=2 sw=2 et:
