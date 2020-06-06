# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=abinit-dev
pkgver=9.0.4
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software. Development version."
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
  ./configure FC=gfortran-8 CC=cc-8 --prefix=/usr --with-hdf5  --without-mpi --with-libxc --with-netcdf --with-netcdf-fortran   --enable-openmp   
  make  -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/abinit-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('93991a0f882218993e43bf5236f60d53bd0a08e0e87824b2807423967cb975afd97dc370bba1804c6f5e44ba2a61c5959b6781e3c438954aac05e5a31dd9baaa')
