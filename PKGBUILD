# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=sqlpp11-connector-odbc
pkgver=0.02
pkgrel=1
pkgdesc="ODBC wrapper for sqlpp11"
arch=('x86_64' 'i686')
url="https://github.com/Erroneous1/sqlpp11-connector-odbc"
license=('CUSTOM')
depends=('sqlpp11')
makedepends=('cmake' 'git' 'unixodbc')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b4ac8b592fa8acdd29996ce999dc928fe805b977e0e91b60f8087d115c1d3f4b')

build() {
    mkdir build
    cd ${pkgname}-${pkgver}
    cd ../build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATE_INCLUDE_DIR=/usr/include/sqlpp11 ../${pkgname}-${pkgver}
    make
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}
  install -Dm644 ../${pkgname}-${pkgver}/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
