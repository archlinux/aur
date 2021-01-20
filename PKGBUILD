# Maintainer: Vlad V. Voronenkov <vladvoronenkov at yandex dot ru>
pkgname=abinit-dev
pkgver=9.2.2
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software. Latest version."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'hdf5' 'libxc' 'netcdf' 'netcdf-fortran' 'netcdf-cxx')
makedepends=('fortran' 'perl')
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

sha512sums=('1698d8dc724936cd0596972e344affa1bd87669b2336c9e38cc5e56a0319ac96ff238202e83d77bb675db40bb39834919c1d1a092336f1d43d05974b9e6b1e5c')
