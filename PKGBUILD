pkgname=mariadb-connector-c
pkgver=2.2.3
pkgrel=1
pkgdesc="MariaDB Connector/C is used to connect applications developed in C/C++ to MariaDB and MySQL databases."
arch=('i686' 'x86_64')
url="https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c/"
license=("LGPL")
depends=('openssl' 'zlib')
makedepends=('cmake')
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz")
sha1sums=('89031eeb4cf56affea30a3d66ff2c6c29462da3d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  rm -rf build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/build"

  cmake \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_SQLITE=OFF \
      -DWITH_OPENSSL=ON \
      -DWITH_MYSQLCOMPAT=ON \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
  make

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/build"

  make DESTDIR="${pkgdir}" install
}
