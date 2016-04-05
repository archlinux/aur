# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy-0.0-26compat
pkgname=${_pkg}-${_subpkg}
pkgver=2.6.12
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

sha512sums=('149cc269e71958b742691ffaeb7e4f40da440cef2e90a9a034bd94e1d2482f9ebbf260b75a0ee4ebbef5f77d7ca0063aa9de75a10b31de47eed3f712d7361eee')
