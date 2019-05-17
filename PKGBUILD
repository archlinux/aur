# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>
# Contributor: symen
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: artemklevtsov
# Contributor: Moritz Bruder <muesli4 at gmail dot com>

pkgname=monetdb
pkgver=11.33.3
pkgrel=1
pkgdesc="MonetDB: an open source database system"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
makedepends=('r' 'python' 'libatomic_ops' 'snappy' 'unixodbc')
depends=('r' 'python' 'libatomic_ops' 'snappy' 'unixodbc')
install=monetdb.install
source=("http://dev.monetdb.org/downloads/sources/Latest/MonetDB-$pkgver.tar.xz")
sha256sums=('f69e7312a77407bef2d970e6d8edfc0ca687d5b31c6b4714bd9132fa468a12e9')

build() {
    cd "$srcdir/MonetDB-$pkgver"
    ./bootstrap
    ./configure --libdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-assert --disable-testing --enable-optimize --enable-rintegration
    make
}

package() {
    cd "$srcdir/MonetDB-$pkgver"
    make "DESTDIR=$pkgdir" install
    mkdir -p "$pkgdir/var/log/monetdb"
}
