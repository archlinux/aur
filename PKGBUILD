# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.7.0
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv-git' 'libctl>=4.1.0' 'hdf5' 'gsl' 'fftw' 'guile' 'julia')
makedepends=('gcc-fortran' 'suitesparse' 'python' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data')
options=('!libtool' '!makeflags')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a5af8c28da2626a0987a6fd4aa97f4fcc5695cf17f9ee2247caa90208efaa8bf')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
