# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.12.0
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
sha256sums=('445441dfe62f5ca053dd864faf63ef037aa8f5948af800bd76e251f834ee4961')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi --without-python
  make 
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
