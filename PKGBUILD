# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.8.4
pkgrel=1
pkgdesc="Clutter integration with GTK+"
arch=('x86_64')
url="https://git.gnome.org/browse/clutter-gtk"
license=(LGPL)
depends=(clutter)
makedepends=(gobject-introspection gtk-doc git meson)
_commit=77483ba46384adde76f6c4599eae77eeec852c56  # tags/1.8.4^0
source=("git+https://git.gnome.org/browse/clutter-gtk#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  mkdir build
  cd $pkgname
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release ../$pkgname \
    -Denable_docs=true
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
