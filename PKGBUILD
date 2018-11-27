# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libgexiv2-git
pkgver=0.11
pkgrel=1
pkgdesc="GObject-based wrapper around the Exiv2 library"
url="https://wiki.gnome.org/Projects/gexiv2"
arch=(x86_64)
license=(GPL2)
conflicts=(libgexiv2)
depends=(exiv2 glib2)
makedepends=(python-gobject python2-gobject gobject-introspection vala git meson)
source=("git+https://git.gnome.org/browse/gexiv2")
sha256sums=('SKIP')

#pkgver() {
#  cd gexiv2
#  git describe --tags | sed 's/^gexiv2-//;s/-/+/g'
#}

prepare() {
  cd gexiv2
}

build() {
  arch-meson gexiv2 build \
    -Denable-gtk-doc=true
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:

