# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.8.4
pkgrel=3
pkgdesc="Clutter integration with GTK+"
url="https://gitlab.gnome.org/GNOME/clutter-gtk"
arch=(x86_64)
license=(LGPL)
depends=(clutter)
makedepends=(gobject-introspection gtk-doc git meson)
_commit=77483ba46384adde76f6c4599eae77eeec852c56  # tags/1.8.4^0
source=("git+https://gitlab.gnome.org/GNOME/clutter-gtk.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -Denable_docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:
