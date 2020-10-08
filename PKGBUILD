# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=abinit-dev
pkgver=9.2.1
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software. Latest version."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'hdf5' 'libxc' 'netcdf' 'netcdf-fortran' 'netcdf-cxx')
makedepends=('gcc8-fortran' 'perl')
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

sha512sums=('31405d3c29526ef4022b5299b94eb729ef0996717e391c865ec1e53dd9c45c688c4c70fbbdbb72c036665cbd153eff141b2eeb5b5bc455e0a24fac350e7cca5d')
