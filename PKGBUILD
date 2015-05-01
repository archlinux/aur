# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.10.4
_pkgver=0.10.4
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libnl' 'libsystemd' 'pam' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client')
makedepends=('freeradius')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz")
sha256sums=('4b58a57d5d3b19dd15bea5f307939d956625a31522e8959d291921c7e1263422')

prepare() {
  cd ${pkgname}-${_pkgver}
  autoreconf -fi
}

build() {
  cd ${pkgname}-${_pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${_pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
