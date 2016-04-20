# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy
pkgname=${_pkg}-${_subpkg}
pkgver=1.1.1
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
sha512sums=('f73a0c73a04ac85687c089fa5b3ce67349c7d089c009a168fac503ec2124ce84c40d06f924cf42499fd8bb3d3a4546a20cc48bfad86b2b785c4251239c7042f1')

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
