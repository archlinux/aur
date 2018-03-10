# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.56.0
pkgrel=1
pkgdesc="Network extensions for GLib"
url="https://git.gnome.org/browse/glib-networking"
arch=(x86_64)
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(meson git)
_commit=d99151580b1ba0efcf737d8b936ae08d02ddac88  # tags/2.56.0^0
source=("git+https://git.gnome.org/browse/glib-networking#commit=$_commit")
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
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir/usr/share/installed-tests"
}

# vim:set ts=2 sw=2 et:
