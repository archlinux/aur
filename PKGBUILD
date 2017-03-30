# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.9.90+156+g6e29f03
pkgrel=1
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/gnome-system-log"
license=(GPL2)
depends=(dconf gtk3)
makedepends=(intltool itstool docbook-xsl git gnome-common)
_commit=6e29f0383b0743b319a5109e4415c71ceb85cc62  # master
source=("git+https://git.gnome.org/browse/gnome-system-log#commit=$_commit")
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
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
