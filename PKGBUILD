# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgname=template-glib
pkgname=template-glib-git
pkgver=3.27.90
pkgrel=1
pkgdesc="A templating library for GLib"
url="https://git.gnome.org/browse/template-glib"
arch=(x86_64)
license=(LGPL)
conflicts=(template-glib)
provides=(template-glib)
depends=(glib2 gobject-introspection-runtime)
makedepends=(git meson vala gobject-introspection gtk-doc)
source=("git+https://git.gnome.org/browse/template-glib")
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
