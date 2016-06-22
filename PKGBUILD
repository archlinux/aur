# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy
pkgname=${_pkg}-${_subpkg}
pkgver=1.1.2
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
sha512sums=('a0b21719db8205a16c574ce21565577787ea00cf2492353bcd4dd79a7ef3b7d685287be47e6eee59fad46c6fa2ac3c6a0e00c26ef88be8b17e9d93fbc763cb10')

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
