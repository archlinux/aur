# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=coap-client
pkgver=4.1.1
pkgrel=2
pkgdesc="Example cli coap client for libcoap"
arch=('i686' 'x86_64' 'armv7h')
url="http://sourceforge.net/projects/libcoap/"
license=('GPL' 'BSD')
depends=('libcoap')
optdepends=()
source=("http://downloads.sourceforge.net/project/libcoap/coap-18/libcoap-$pkgver.tar.gz")
md5sums=('2ab6daf1f187f02d25b77c39c2ecc56b')

build() {
  cd "libcoap-${pkgver}"
  ./configure --prefix=/usr --with-shared
  make libcoap.a
  cd examples
  make client
}

package() {
  cd "libcoap-${pkgver}"
  install -D -m755 examples/client "$pkgdir/usr/bin/coap-client"
  install -D -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -D -m644 LICENSE.GPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL"
}
