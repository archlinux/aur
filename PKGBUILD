# Maintainer: Mubashshir <ahmubashshir@gmail.com>
pkgname=libgvo
pkgver=2.0.0.2
pkgrel=1
pkgdesc='Serialization to/from Variant/Json for GObject classes.'
arch=(i686 x86_64)
url='https://gitlab.gnome.org/esodan/libgvo'
license=(LGPL3)
depends=(libgee json-glib)
makedepends=(git meson vala)
source=("git+https://gitlab.gnome.org/esodan/libgvo.git#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --tags  | sed 's/_/./g;s/-/+/g'
}

build() {
  arch-meson "$pkgname" build \
             -Dsubprojects=false \

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
