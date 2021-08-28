# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=glib-networking
pkgver=2.68.2
pkgrel=1
epoch=1
pkgdesc="Network extensions for GLib"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(glib2 libproxy gnutls gsettings-desktop-schemas)
makedepends=(meson git)
checkdepends=(ca-certificates)
_commit=b6cb0f3c1bb5a5c6033a2ca6362e6561b0f9b2ed  # tags/2.68.2^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
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

# vim:set sw=2 et:
