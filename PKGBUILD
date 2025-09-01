# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>

pkgname=libgrss
pkgver=0.7.0+16+g971c421
pkgrel=4
pkgdesc="Glib-based library to manage RSS and Atom feeds"
url="https://wiki.gnome.org/Projects/Libgrss"
arch=(x86_64)
license=(LGPL3)
depends=(glib2 libsoup libxml2)
makedepends=(intltool gtk-doc gobject-introspection git glib2-devel)
_commit=971c421dc26400e933de60b71eea0335a9ba2693  # master
source=("git+https://git.gnome.org/browse/libgrss#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
