# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>
# Contributor: symen
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=monetdb
pkgver=11.25.9
pkgrel=1
pkgdesc="MonetDB: an open source database system"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
makedepends=('python' 'apache-ant' 'r')
source=("http://dev.monetdb.org/downloads/sources/Latest/MonetDB-$pkgver.tar.xz")
sha256sums=('45bacc0c674060eb1d2ec3dff2a36520d3f42b6c2461d2dd06a19f239a05ab6e')

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
