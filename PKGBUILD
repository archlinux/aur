# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=glib-networking
pkgver=2.78.0
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
_commit=40c448faf7cf32647d457a8bcda171c3d21bef22  # tags/2.78.0^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd glib-networking
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib-networking
}

build() {
  local meson_options=(
  )

  arch-meson glib-networking build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
