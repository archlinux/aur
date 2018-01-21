# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.4.1
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile' 'julia')
makedepends=('gcc-fortran' 'suitesparse' 'python' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data')
options=('!libtool' '!makeflags')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevengj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c909036324b9aa08f05ec210752829634a5135ec806d7ef345d4211e25cea6e4')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh CC=gcc CXX=g++ --prefix=/usr --enable-shared --with-mpi
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
