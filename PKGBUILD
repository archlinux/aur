# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway
pkgver=0.0.9
pkgrel=2
pkgdesc="WebRTC gateway."
arch=('i686' 'x86_64')
url="http://janus.conf.meetecho.com/"
license=('GPL3')
depends=('libmicrohttpd' 'jansson' 'libnice' 'openssl' 'libsrtp'
         'sofia-sip' 'libusrsctp-git' 'libwebsockets15' 'libevent' 
         'librabbitmq-c' 'opus' 'libogg' 'glib2' 'ding-libs')
makedepends=('gengetopt')
provides=(janus-gateway)
backup=('etc/janus/janus.cfg')
install=janus-gateway.install

source=("https://github.com/meetecho/janus-gateway/archive/v${pkgver}.tar.gz")
md5sums=('cb9adfb8fa0eb0bf571082cfe2df3add')

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
