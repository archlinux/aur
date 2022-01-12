# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.22.0
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
sha256sums=('f7486a1f25f8e90a5f39785ad9c1f7a029f99443db7dc3a5bb44b4eba2651625')

build() {
  cd meep-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
  make 
}
package() {
  cd meep-$pkgver
  make DESTDIR="$pkgdir" install
}

