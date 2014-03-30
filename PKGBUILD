# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.3.2
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libdbus' 'libnl' 'libsystemd' 'pam' 'protobuf-c')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz")
sha256sums=('a420bff8d26bd7b1e820b875a264bd8fdae871770120f3adf131b040cbf6ed9a')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  sed -e 's/CPPFunction/rl_completion_func_t/' -i src/occtl.c
}

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
