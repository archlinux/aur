# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.60.1+2+g1ce6b40
pkgrel=1
pkgdesc="Network extensions for GLib"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(glib2 libproxy gnutls gsettings-desktop-schemas)
makedepends=(meson git openssl)
checkdepends=(ca-certificates)
optdepends=('openssl: Alternative backend')
_commit=1ce6b40da8ecbf997c5522a592a122e805aa81c4  # master
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
  arch-meson $pkgname build -D openssl=enabled
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
