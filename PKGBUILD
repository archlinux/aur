# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-search-tool
pkgver=3.6.0+82+g4a8f34e
pkgrel=2
pkgdesc="Utility to search for files"
url="https://gitlab.gnome.org/Archive/gnome-search-tool"
arch=(x86_64)
license=(GPL2)
depends=(nautilus libsm)
makedepends=(intltool yelp-tools git gnome-common)
_commit=4a8f34e050fb794852264cf54feb7d449dd15965  # master
source=("git+https://gitlab.gnome.org/Archive/gnome-search-tool.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix configure
  sed -i '/^AM_GNU_GETTEXT/d' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  make -C $pkgname check
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
}

# vim:set ts=2 sw=2 et:
