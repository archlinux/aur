# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.17.1
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile' 'julia' 'mpb')
makedepends=('gcc-fortran' 'suitesparse' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data')
options=('!libtool' '!makeflags' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('271b4a547a7abc2e7ac67ecc06c2f112603c7de48c774a519f014b99b59185ad')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi --without-python
  make 
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
