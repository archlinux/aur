# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.8.4
pkgrel=2
pkgdesc="Clutter integration with GTK+"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/clutter-gtk"
license=(LGPL)
depends=(clutter)
makedepends=(gobject-introspection gtk-doc git meson)
_commit=77483ba46384adde76f6c4599eae77eeec852c56  # tags/1.8.4^0
source=("git+https://gitlab.gnome.org/GNOME/clutter-gtk.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -Denable_docs=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
