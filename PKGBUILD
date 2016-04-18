# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pimd
pkgver=2.1.8
pkgrel=6
pkgdesc="A stand-alone implementation of the DVMRP multicast routing protocol."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/pimd"
license=('BSD')
backup=('etc/pimd.conf')
conflicts=('quagga>=1.0')
depends=('glibc')
source=("http://cloud.github.com/downloads/troglobit/pimd/pimd-${pkgver}.tar.bz2"
	"pimd.service")
md5sums=('a12448bc7c9bfcebf51a13ebf1ffa962'
         '9e221e6c80905fb48d87282b32352e7c')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|sbin|bin|g' Makefile
  sed -i 's| -Werror||' Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make
}
package() {
  cd ${pkgname}-${pkgver}
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 ../pimd.service "$pkgdir/usr/lib/systemd/system/pimd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pimd/LICENSE"
  install -Dm644 LICENSE.mrouted "$pkgdir/usr/share/licenses/pimd/LICENSE.mrouted"
}
