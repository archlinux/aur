# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy-0.0-26compat
pkgname=${_pkg}-${_subpkg}
pkgver=2.6.11
pkgrel=1
pkgdesc='Official MongoDB C++ driver (26compat).'
arch=('i686' 'x86_64')
url='http://www.mongodb.org'
license=(APACHE)
depends=('boost-libs' 'pcre' 'snappy' 'openssl' 'gperftools' 'libsasl')
makedepends=('scons' 'boost' 'readline' 'ncurses')
source=("https://github.com/mongodb/${_pkg}/archive/${_subpkg}-${pkgver}.tar.gz")
conflicts=("mongodb<2.6.0")
options=("staticlibs")
provides=("mongo-cxx-driver")

build() {
  cd ${pkgname}-${pkgver}

  scons \
    --use-system-boost \
    --use-system-pcre \
    --use-system-snappy \
    --use-sasl-client \
    --ssl \
    --disable-warnings-as-errors \
    --sharedclient
}

package() {
  cd ${pkgname}-${pkgver}
  
  scons \
    --full \
    --use-system-boost \
    --use-system-pcre \
    --use-system-snappy \
    --use-sasl-client \
    --ssl \
    --disable-warnings-as-errors \
    --sharedclient \
    --prefix="$pkgdir/usr" \
    install-mongoclient
}

sha512sums=('9323b58b7ae80257d02b61c7c71f087f1953db9b8a5d0b7cad185cda844d37f710c07ef5dcbbc728f261b08aa2e474ef5f3044abcbcd0d4c954d39ef94468bfe')
