# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pimd
pkgver=2.1.8
pkgrel=4
pkgdesc="pimd is an implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/pimd"
license=('BSD')
backup=('etc/pimd.conf')
source=("http://cloud.github.com/downloads/troglobit/pimd/pimd-${pkgver}.tar.bz2"
	"pimd.service")
md5sums=('a12448bc7c9bfcebf51a13ebf1ffa962'
         '98a6e21a7c41cd8da8ac53038ecf3c8c')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"

  make
}
package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make prefix=/usr DESTDIR=$pkgdir install
  install -Dm644 $srcdir/pimd.service "$pkgdir/usr/lib/systemd/system/pimd.service"
}
