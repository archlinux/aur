# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=abinit-dev
pkgver=9.4.1
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software. Latest version."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'hdf5' 'libxc' 'netcdf' 'netcdf-fortran' 'netcdf-cxx')
makedepends=('gcc-fortran' 'perl')
conflicts=('abinit')
provides=('abinit')
source=(
  "https://www.abinit.org/sites/default/files/packages/abinit-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/abinit-$pkgver"
  ./configure FC=gfortran CC=cc --prefix=/usr --with-hdf5  --without-mpi --with-libxc --with-netcdf --with-netcdf-fortran   --enable-openmp   
  make  -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/abinit-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('b386a285795c286721502b796854ba12f38d258a53a6319258f607b2a8cd831b7c5102e969e39bfd1922ec62bfdda9f05012b868fe83da23036c740ffc52d6eb')
