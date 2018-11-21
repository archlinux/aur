# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>
# Contributor: symen
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: artemklevtsov
# Contributor: Moritz Bruder <muesli4 at gmail dot com>

pkgname=monetdb
pkgver=11.31.11
pkgrel=1
pkgdesc="MonetDB: an open source database system"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
makedepends=('r' 'python' 'libatomic_ops' 'snappy' 'unixodbc')
depends=('r' 'python' 'libatomic_ops' 'snappy' 'unixodbc')
install=monetdb.install
source=("http://dev.monetdb.org/downloads/sources/Latest/MonetDB-$pkgver.tar.xz")
sha256sums=('169f78f6509241e63028adec3f5082fdcf9f8a1ae9d87a59dddf423f8e9f81d5')

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
