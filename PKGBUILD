# Maintainer:  <gucong@gc-desktop>
pkgname=zoltan
pkgver=3.83
pkgrel=2
pkgdesc="Parallel Partitioning, Load Balancing and Data-Management Services"
arch=('i686' 'x86_64')
url="http://www.cs.sandia.gov/zoltan"
license=('LGPL')
depends=('scotch' 'metis' 'openmpi')
source=(http://www.cs.sandia.gov/~kddevin/Zoltan_Distributions/${pkgname}_distrib_v${pkgver}.tar.gz)
md5sums=('1ff1bc93f91e12f2c533ddb01f2c095f')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  ../Zoltan_v$pkgver/configure \
      --prefix=/usr \
      --enable-mpi --with-mpi-compilers \
      --with-mpi-incdir="/usr/include" \
      --with-mpi-libdir="/usr/lib/openmpi" \
      --with-gnumake \
      --enable-zoltan \
      --with-scotch \
      --with-scotch-incdir="/usr/include/scotch" \
      --with-scotch-libdir="/usr/lib" \
      --with-parmetis \
      --with-parmetis-incdir="/usr/include" \
      --with-parmetis-libdir="/usr/lib" \
      --with-cflags="-fPIC"

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
