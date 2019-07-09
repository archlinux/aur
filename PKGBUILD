# Maintainer: Julien Seguinot <seguinot@vaw.baug.ethz.ch>

pkgname=pism
pkgver=1.1.4
pkgrel=1
pkgdesc="Parallel Ice Sheet Model (PISM)"
arch=('i686' 'x86_64')
url="http://www.pism-docs.org/"
license=('GPL')
depends=('fftw>=3.1' 'gsl>=1.15' 'netcdf' 'openmpi' 'petsc>=3.5' 'proj' 'udunits')
makedepends=('gcc' 'cmake>=3.1')
optdepends=()  # FIXME proj is an optional dependence
source=("https://github.com/pism/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('85efc2b9b6951ad554609230fe6f9af9')

build() {
  mkdir -p "$pkgname-$pkgver/build"
  cd "$pkgname-$pkgver/build"
  CC=mpicc CXX=mpicxx PETSC_DIR=/opt/petsc/linux-c-opt PISM_INSTALL_PREFIX=/usr cmake .. -DPism_USE_PROJ4=Yes
  make -j 4
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
