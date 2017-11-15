# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.9.90+160+g4b07190
pkgrel=1
pkgdesc="View your system logs"
arch=(x86_64)
url="https://git.gnome.org/browse/gnome-system-log"
license=(GPL2)
depends=(dconf gtk3)
makedepends=(intltool itstool docbook-xsl git gnome-common)
_commit=4b071909a0ca38a73a9cc5b287ffc2b0a744566b  # master
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
