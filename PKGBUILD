# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.2.3
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'gnutls')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz")
sha256sums=('eb3fe2b2bf40d68c92d1f63cc0e52385ad614f203acd97811d352ac90e74a147')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}
package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
}
