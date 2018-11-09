# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.12+4+g9ad7287
pkgrel=2
pkgdesc="A CSS parsing library"
url="https://gitlab.gnome.org/GNOME/libcroco"
arch=(x86_64)
depends=(glib2 libxml2)
makedepends=(intltool git gtk-doc)
license=(LGPL)
_commit=9ad72875e9f08e4c519ef63d44cdbd94aa9504f7  # master
source=("git+https://gitlab.gnome.org/GNOME/libcroco.git#commit=$_commit")
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
