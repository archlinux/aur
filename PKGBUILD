# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.10.7
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libnl' 'libsystemd' 'pam' 'protobuf-c' 'talloc' 'libseccomp' 'freeradius-client')
makedepends=('freeradius')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz")
sha256sums=('222212baae53e7f74273245e1459d4132cda41ad255a21f1e42ab4cd240f431d')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
  install -Dm0644 doc/systemd/standalone/ocserv.service "$pkgdir/usr/lib/systemd/system/ocserv.service"
}
