# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.26.0
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
sha256sums=('b4511aa4cf561c857945b9dee392a28071b742f952d4db883b8153f8e393e7fa')

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

