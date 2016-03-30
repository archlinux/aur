# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=sqlpp11-connector-odbc
pkgver=0.02.1
pkgrel=1
pkgdesc="ODBC wrapper for sqlpp11"
arch=('x86_64' 'i686')
url="https://github.com/Erroneous1/sqlpp11-connector-odbc"
license=('CUSTOM')
depends=('sqlpp11')
makedepends=('cmake' 'git' 'unixodbc')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e8f89cc6a6aa7eae33d8fb90d4fc77af5f74bc2ecd08ea91cb63bb8804fb2476')

prepare() {
    rm -Rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATE_INCLUDE_DIR=/usr/include/sqlpp11 ../${pkgname}-${pkgver}
}

build() {
    cd build
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}
    install -Dm644 ../${pkgname}-${pkgver}/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
