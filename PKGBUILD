# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.21.0
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package (with Python support)"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile' 'julia' 'mpb' 'python' 'python-numpy' 'python-scipy' 'python-matplotlib')
makedepends=('gcc-fortran' 'suitesparse' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data')
options=('!libtool' '!makeflags' 'staticlibs')
conflicts=('meep')
source=("meep-$pkgver.tar.gz::https://github.com/NanoComp/meep/archive/v$pkgver.tar.gz")
sha256sums=('71911cd2f38b15bdafe9a27ad111f706f24717894d5f9b6f9f19c6c10a0d5896')

build() {
  cd meep-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
  make 
}
package() {
  cd meep-$pkgver
  make DESTDIR="$pkgdir" install
}

