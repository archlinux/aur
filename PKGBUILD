# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pimd
pkgver=2.3.2
pkgrel=1
pkgdesc="A stand-alone implementation of the DVMRP multicast routing protocol."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/pimd"
license=('BSD')
backup=('etc/pimd.conf')
conflicts=('quagga>=1.0')
depends=('glibc')
source=("https://github.com/troglobit/pimd/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
	"pimd.service")
md5sums=('a3c03e40540980b2c06e265a17988e60'
         '9e221e6c80905fb48d87282b32352e7c')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 ../pimd.service "$pkgdir/usr/lib/systemd/system/pimd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pimd/LICENSE"
  install -Dm644 LICENSE.mrouted "$pkgdir/usr/share/licenses/pimd/LICENSE.mrouted"
}
