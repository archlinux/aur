# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.29.0
pkgrel=1
pkgdesc="A free finite-difference time-domain simulation software package (with Python support)"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Meep"
license=('GPL')
depends=('openmpi' 'harminv' 'libctl' 'hdf5' 'gsl' 'fftw' 'guile' 'julia' 'python' 'python-numpy')
makedepends=('gcc-fortran' 'suitesparse' 'swig')
optdepends=('h5utils: for visualization and conversion of scientific data'
            'python-matplotlib: for visualization in Python'
            'python-scipy: for scientific computations in Python'
            'python-autograd: for fast differentiation in Python')
options=('!libtool' '!makeflags' 'staticlibs')
conflicts=('meep')
source=("meep-$pkgver.tar.gz::https://github.com/NanoComp/meep/archive/v$pkgver.tar.gz")
sha256sums=('f63bdf6a8fbae8aad87d4f683da3a466d687848a53bbebe1d6935fb268aeeffa')

prepare() {
  cd meep-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi --without-mpb
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

