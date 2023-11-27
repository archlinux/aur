# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=9.10.3
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi' 'netcdf' 'netcdf-fortran' 'hdf5' 'libxc')
makedepends=('gcc-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build
  ../configure \
    FC=gfortran \
    CC=cc \
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

sha512sums=('ffc8ca677a8c4dc856d53c1b3967f9c61bf7507602c497ade8acb7864abae2d8cfe3bd2afbceae3288da5fa9fa2ba331c7fbdd6978626f2b7d971a0a0f22885a')
