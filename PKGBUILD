# Maintainer: a821

pkgname=json-glib-git
pkgver=1.10.6.r7.g05f71c4
pkgrel=1
pkgdesc="JSON library built on GLib"
url="https://wiki.gnome.org/Projects/JsonGlib"
arch=(x86_64)
license=('LGPL-2.1-or-later')
depends=('glib2')
makedepends=(
  docbook-xsl
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-docutils
)
conflicts=('json-glib')
provides=('json-glib' 'libjson-glib-1.0.so')
source=("git+https://gitlab.gnome.org/GNOME/json-glib.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  arch-meson -D man=true -D installed_tests=false build json-glib
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  depends+=(libg{lib,object,io}-2.0.so)
  DESTDIR="$pkgdir" meson install -C build
}
