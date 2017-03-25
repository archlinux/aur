# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=sqlpp11-connector-odbc
pkgver=0.04
pkgrel=1
pkgdesc="ODBC wrapper for sqlpp11"
arch=('x86_64' 'i686')
url="https://github.com/Erroneous1/sqlpp11-connector-odbc"
license=('CUSTOM')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'unixodbc' 'sqlpp11>=0.45')
optdepends=('sqlpp11: For building programs using sqlpp11-connector-odbc')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0bc10efed72f793339f8373f772eae3e3b50a780261072a3aa2c4f4a0ba5399a')
options=(staticlibs)

prepare() {
    rm -Rf build
    mkdir build
    cd build
    cmake \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_SQLPP11_CONNECTOR_ODBC_TESTS_IGNORE=1 \
        -DDATE_INCLUDE_DIR=/usr/include/sqlpp11 \
        ../${pkgname}-${pkgver}
}

build() {
    cd build
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}/usr/" install
    mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}
    install -Dm644 ../${pkgname}-${pkgver}/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
