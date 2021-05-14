# Maintainer: jose1711 <jose1711@gmail.com>
# Contributor: dimytch

pkgname=gkrellm2-multiping
pkgver=2.0.15
pkgrel=3
pkgdesc="Pings several machines and shows the current round-trip and status."
arch=('i686' 'x86_64')
url="http://members.dslextreme.com/users/billw/gkrellm/Plugins.html"
source=("$pkgname-$pkgver"::"https://github.com/jmakovicka/gkrellm-multiping/archive/refs/tags/${pkgver}.tar.gz")
license=('GPL')
depends=('gkrellm')

build() {
  cd ${srcdir}/gkrellm-multiping-${pkgver}
  sed -i -e "/^INSTALLROOT/s/\/local//g" -e "s/ -Wl / /" Makefile
  make
}

package() {
  cd ${srcdir}/gkrellm-multiping-${pkgver}
  install -D -c -s -m 644 multiping.so $pkgdir/usr/lib/gkrellm2/plugins/multiping.so
  install -D -c -s -m 4755 pinger $pkgdir/usr/lib/gkrellm2/exec/pinger
}
md5sums=('593052491ef2c3c3bc8ca7f326b9fdc2')
