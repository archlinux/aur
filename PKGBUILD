# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.1.4
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('gnutls')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz")
sha256sums=('1c7e424f29a6da4b46fdc9b8002a2e65b77435310230c2f512bb20a3e6027cf4')

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
