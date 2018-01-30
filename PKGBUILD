# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=meep
pkgver=1.4.2
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
sha256sums=('b70a8161ce1f506bbfc107589f02c574ee4fc4d2db48e690a1e42b00e0f23740')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
