# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=odb_api
pkgver=0.16.2
pkgrel=2
pkgdesc="ECMWF Observational data library"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/ODBAPI/ODB+API+Home"
license=('Apache')
groups=(science)
depends=()
makedepends=(boost cmake netcdf eccodes)
optdepends=(git openmpi lapack cuda doxygen bison flex eigen armadillo viennacl libaio intel-mkl python)
options=('staticlibs')
source=(https://software.ecmwf.int/wiki/download/attachments/61117379/${pkgname}_bundle-${pkgver}-Source.tar.gz)
md5sums=('b77044ab2c0e5ef860439bcf27e1e173')

build() {
  cd ${srcdir}/${pkgname}_bundle-${pkgver}-Source
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_NETCDF=ON \
        -DENABLE_FORTRAN=ON \
        -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/${pkgname}_bundle-${pkgver}-Source/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
