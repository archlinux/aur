# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.28.0
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package (with Python support)"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile' 'julia' 'mpb' 'python' 'python-numpy')
makedepends=('gcc-fortran' 'suitesparse' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data'
            'python-matplotlib: for visualization in Python'
            'python-scipy: for scientific computations in Python'
            'python-autograd: for fast differentiation in Python')
options=('!libtool' '!makeflags' 'staticlibs')
conflicts=('meep')
source=("meep-$pkgver.tar.gz::https://github.com/NanoComp/meep/archive/v$pkgver.tar.gz")
sha256sums=('fe79ec9b0d0cf87c3855a1661a38f23a3100120174f7e2df8add96cafe201544')

prepare() {
  cd meep-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
}

build() {
  cd meep-$pkgver/src
  make sphere-quad.h
  cd ..
  make 
}

package() {
  cd meep-$pkgver
  make DESTDIR="$pkgdir" install
}

