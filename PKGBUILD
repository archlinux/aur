# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>
# Contributor: symen
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=monetdb
pkgver=11.25.5
pkgrel=1
pkgdesc="MonetDB: an open source database system"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
makedepends=('python' 'apache-ant')
source=("http://dev.monetdb.org/downloads/sources/Latest/MonetDB-$pkgver.tar.xz")
sha256sums=('faf18100b82b7bcc78785692dfe3e2d64808df92e69d3add60a2cc80ec7619ed')

build() {
  cd "$srcdir/MonetDB-$pkgver"
 ./bootstrap
 ./configure --libdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-assert --disable-testing --enable-optimize
 make
}

package() {
  cd "$srcdir/MonetDB-$pkgver"
  make "DESTDIR=$pkgdir" install
  mkdir -p "$pkgdir/var/log/monetdb"
}
