# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=parallel-netcdf
pkgver=1.8.1
pkgrel=1
pkgdesc="Parallel-NetCDF is a library providing high-performance I/O while still maintaining file-format compatibility with Unidata's NetCDF."
arch=(i686 x86_64)
url="http://trac.mcs.anl.gov/projects/parallel-netcdf"
license=('custom')
options=(staticlibs)
groups=(science)
depends=(openmpi)
makedepends=(gcc-fortran)
source=(http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/${pkgname}-${pkgver}.tar.gz)
md5sums=('8cc62be19c53417b0461af281cb27e78')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-mpi=/usr CPPFLAGS="$CPPFLAGS -fPIC"
  make || return 1
  make tests || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i man/Makefile -e 's/) \$"/"/'
  make prefix="$pkgdir/usr" install
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 $srcdir/$pkgname-$pkgver/COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
