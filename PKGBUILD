# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.13
pkgrel=2
pkgdesc="A CSS parsing library"
url="https://gitlab.gnome.org/GNOME/libcroco"
arch=(x86_64)
depends=(glib2 libxml2)
makedepends=(intltool git gtk-doc)
license=(LGPL)
_commit=7e15ca6c2c29a4b78367e6efa6195b331a92b2a7  # tags/0.6.13^0
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
