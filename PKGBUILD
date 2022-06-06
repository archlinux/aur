# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>

pkgname=meep-python
pkgver=1.23.0
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
sha256sums=('ad6132deb73ca2e77a177acb4367be5d0411994ca59c3589751b836ba8a4e82e')

build() {
  cd meep-$pkgver
  ./autogen.sh CFLAGS=" -fPIC" --prefix=/usr --enable-shared --with-mpi
  make 
}
package() {
  cd meep-$pkgver
  make DESTDIR="$pkgdir" install
}

