# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=9.8.2
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

sha512sums=('aa155642d0a4af552ffe4f0809d6fe754f8aafae5cd6728489ca2d111276152c4a74e466e06d65ad137e077e3bd51bbc7dadf0de80b623d9f2bbf653f942eee8')
