# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>
# Contributor: symen
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: artemklevtsov
# Contributor: Moritz Bruder <muesli4 at gmail dot com>
# Contributor: Philipp Fent <philipp@fent.de>

pkgname=monetdb
pkgver=11.45.7
pkgrel=1
pkgdesc="MonetDB: an open source database system"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=(MPL)
makedepends=('cmake' 'ninja')
depends=('r' 'python' 'libatomic_ops' 'snappy' 'unixodbc' 'libxml2')
install=monetdb.install
source=("https://dev.monetdb.org/downloads/sources/archive/MonetDB-$pkgver.tar.xz")
sha256sums=('3707897bb84ecbb73b196bed06a017a7f8a9f50bc8cfca87eb496e87d9254a0e')

prepare() {
    cd "$srcdir/MonetDB-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/MonetDB-$pkgver/build"
    cmake ".." -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DRELEASE_VERSION=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DASSERT=OFF \
      -DSTRICT=OFF \
      -DTESTING=OFF \
      -DFITS=OFF \
      -DGEOM=OFF \
      -DNETCDF=OFF \
      -DODBC=OFF \
      -DPY3INTEGRATION=OFF \
      -DRINTEGRATION=OFF \
      -DSHP=OFF \
      -DWITH_BZ2=ON \
      -DWITH_CMOCKA=OFF \
      -DWITH_CURL=ON \
      -DWITH_LZ4=ON \
      -DWITH_LZMA=ON \
      -DWITH_PCRE=ON \
      -DWITH_PROJ=OFF \
      -DWITH_SNAPPY=OFF \
      -DWITH_XML2=ON
    ninja all
}

package() {
    cd "$srcdir/MonetDB-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
    mkdir -p "$pkgdir/var/log/monetdb"
}
