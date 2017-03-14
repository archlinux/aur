# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.2.2
pkgrel=1
pkgdesc="WebRTC gateway."
arch=('i686' 'x86_64')
url="http://janus.conf.meetecho.com/"
license=('GPL3')
depends=('libmicrohttpd' 'jansson' 'libnice' 'openssl' 'libsrtp'
         'sofia-sip' 'libusrsctp-git' 'libwebsockets15' 'libevent' 
         'librabbitmq-c' 'opus' 'libogg' 'glib2' 'ding-libs')
makedepends=('gengetopt' 'paho-mqtt-c-git')
provides=(janus-gateway)
backup=('etc/janus/janus.cfg')
install=janus-gateway.install

source=("https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz")
sha256sums=('f5b1909fd9b8546f8be518f7c682b80916a8204c95f23a95c720524df62cca34')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-docs
  DESTDIR="$pkgdir/" make
}

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" make install configs
  rm -f "$pkgdir/usr/share/janus/certs/mycert.{key,pem}"
} 
