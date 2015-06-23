# Maintainer: Joe George <joe@externl.com>

pkgname=java-berkeleydb
pkgver=5.3.28
_pkg_major=5.3
pkgrel=3
pkgdesc="Java bindings for the Berkeley DB embedded database system"
arch=(i686 x86_64)
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('java-environment' 'db')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz https://zeroc.com/download/berkeley-db/berkeley-db.5.3.28.patch)

build() {
    cd ${srcdir}/db-${pkgver}/build_unix
    ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-java
    make LIBSO_LIBS=-lpthread
}

package() {
    install -Dm644 ${srcdir}/db-${pkgver}/build_unix/db.jar \
        ${pkgdir}/usr/share/java/berkeleydb/db.jar

    install -Dm644 ${srcdir}/db-${pkgver}/build_unix/libdb_java-$_pkg_major.la \
        ${pkgdir}/usr/lib/libdb_java-$_pkg_major.la
}

prepare() {
    cd ${srcdir}/db-${pkgver}   
    patch -Np1 -i ../berkeley-db.${pkgver}.patch
}

md5sums=('b99454564d5b4479750567031d66fe24'
         '1892bb1e53db84242eda1d80c15b64cc')
