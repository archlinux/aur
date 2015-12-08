# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy
pkgname=${_pkg}-${_subpkg}
pkgver=1.1.0
pkgrel=1
pkgdesc='Official MongoDB C++ driver (legacy).'
arch=('i686' 'x86_64')
url='http://www.mongodb.org'
license=(APACHE)
depends=('boost-libs' 'openssl' 'libsasl')
makedepends=('scons' 'boost' 'readline')
source=("https://github.com/mongodb/${_pkg}/archive/${_subpkg}-${pkgver//_/-}.tar.gz")
conflicts=("mongodb<2.6.0")
options=("staticlibs")
provides=("mongo-cxx-driver")
sha512sums=('c7f65d03bacf54ceced745c3b810e0b53f4b42ed3378dfc0a0a975d486ee10154307739f86a7c1df7be683c57462f91e44f8764a22233c6b177ae13c08ec3495')

package() {
  cd ${pkgname}-${pkgver//_/-}
  
  scons \
    --use-sasl-client \
    --ssl \
    --prefix="$pkgdir/usr" \
    --disable-warnings-as-errors \
    --sharedclient \
    install
}
