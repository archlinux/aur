pkgname=gnome-autoar
pkgver=0.1.r159.g0fec26d
pkgrel=1
pkgdesc="Automatic archives creating and extracting library"
arch=(i686 x86_64)
license=(GPL)
depends=(glib2 gtk3 libarchive)
url="http://www.gnome.org"
source=('git://git.gnome.org/gnome-autoar')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo 0.1.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
  #git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh:ts=2:sw=2:et
