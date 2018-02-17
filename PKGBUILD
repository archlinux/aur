# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=jsonrpc-glib
pkgname=jsonrpc-glib-git
pkgver=3.27.90+6+g3201386
pkgrel=1
pkgdesc="A JSON-RPC library for GLib"
url="https://git.gnome.org/browse/jsonrpc-glib"
arch=(x86_64)
license=(LGPL)
conflicts=(jsonrpc-glib)
provides=(jsonrpc-glib)
depends=('json-glib')
makedepends=('git' 'meson' 'vala' 'gobject-introspection' 'gtk-doc')
source=("git+https://git.gnome.org/browse/jsonrpc-glib")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson ../$_pkgname -Denable_gtk_doc=true
  ninja
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
