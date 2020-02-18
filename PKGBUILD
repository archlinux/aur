# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=clutter-gtk
pkgname=$_pkgname-git
pkgver=1.8.5+11+ec9239ba
pkgrel=1
pkgdesc="Clutter integration with GTK+"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/clutter-gtk"
license=(LGPL)
depends=(clutter)
makedepends=(gobject-introspection gtk-doc git meson)
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  meson $_pkgname build -Denable_docs=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
