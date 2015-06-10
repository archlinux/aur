# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy-0.0-26compat
pkgname=${_pkg}-${_subpkg}
pkgver=2.6.10
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
    --sharedclient \
    --prefix="$pkgdir/usr" \
    install-mongoclient
}

sha512sums=('375227bdf5ffa2b85f2ad3e3132ae3f55a825bbc58f5cff62ee53d075bd57a6f85e11cd4f2eb14c62ea2ad3e5cba936dd5355df8c5db7df7daec0fab96ff3f08')
