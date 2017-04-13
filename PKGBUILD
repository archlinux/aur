# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.12
pkgrel=1
pkgdesc="A CSS parsing library"
url="https://git.gnome.org/browse/libcroco"
arch=(x86_64 i686)
depends=(glib2 libxml2)
makedepends=(intltool git gtk-doc)
license=(LGPL)
_commit=0d0162098ac6630113da9e66620ab29459352dd6  # tags/0.6.12^0
source=("git+https://git.gnome.org/browse/libcroco#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd $pkgname
  make check
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
