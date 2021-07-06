# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=9.4.2
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi' 'netcdf' 'netcdf-fortran' 'hdf5' 'libxc')
makedepends=('gcc8-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build
  ../configure \
    FC=gfortran-8 \
    CC=cc-8 \
    --with-libxc \
    --with-hdf5 \
    --with-netcdf \
    --with-netcdf-fortran \
    --enable-openmp \
    --without-mpi \
    --prefix=/usr \
    #--disable-all-plugins
  make
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

sha512sums=('35417e8bff9b0ff06471b994625e43b8d6e35bb32771a38b60c0f4f07946853e9e6a1189b36b548011a93d54008a4ebbdcabf318a654e46ee6e6e2664be7f4cb')
