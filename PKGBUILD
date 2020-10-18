# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=9.2.1
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
    --with-libxc='yes' \
    --with-hdf5='yes' \
    --with-netcdf='yes' \
    --with-netcdf-fortran='yes' \
    --prefix=/usr \
    #--disable-all-plugins
  make -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

sha512sums=('31405d3c29526ef4022b5299b94eb729ef0996717e391c865ec1e53dd9c45c688c4c70fbbdbb72c036665cbd153eff141b2eeb5b5bc455e0a24fac350e7cca5d')
