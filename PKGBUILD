# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=glib-networking
pkgver=2.76.1
pkgrel=1
epoch=1
pkgdesc="Network extensions for GLib"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(
  glib2
  gnutls
  gsettings-desktop-schemas
  libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(ca-certificates)
_commit=31c21c5efe2a1b930c7029c1e66340de9f97dafc  # tags/2.76.1^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
