# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=glib-networking
pkgver=2.80rc
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
  gsettings-desktop-schemas
  libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(ca-certificates)
_commit=dc18aced15f4b1ec885eada7f0ec12d09693fb95  # tags/2.80.rc^0
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
