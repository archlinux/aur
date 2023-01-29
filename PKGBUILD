# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Clarence <xjh.azzbcc@gmail.com>

pkgname=myodbc
pkgver=8.0.32
pkgrel=1
pkgdesc="ODBC driver/connector for MySQL"
arch=(i686 x86_64)
url="https://dev.mysql.com/downloads/connector/odbc/"
depends=('unixodbc' 'libmysqlclient')
makedepends=('cmake' 'gtk3')
optdepends=('gtk3: graphical interface')
license=('GPL')
options=('libtool')
source=("https://cdn.mysql.com/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-$pkgver-src.tar.gz")
md5sums=('400b96bb94375717f0a824feeab420ff')

build() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_UNIXODBC=1 \
    .
  make
}

package() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  make DESTDIR=$pkgdir install
  cd $pkgdir/usr
  rm -rf test
  install -dm0755 share/mysql-connector-odbc
  mv ChangeLog INFO_BIN INFO_SRC LICENSE.txt README.txt \
    share/mysql-connector-odbc/
}
