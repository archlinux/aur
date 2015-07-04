# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=gctpc
pkgver=20
pkgrel=2
pkgdesc="GCTPC is a software library for geolocation written by the USGS"
arch=("i686" "x86_64")
url="http://www.nco.ncep.noaa.gov/pmb/codes/nwprod/util/sorc/wgrib2.cd/grib2/gctpc/announce.txt"
depends=('libdap')
options=('staticlibs')
license=('public_domain')
source=(http://www.nco.ncep.noaa.gov/pmb/codes/nwprod/util/sorc/wgrib2.cd/grib2/${pkgname}${pkgver}.tar.Z
        Makefile)
md5sums=('89c24014a35288a7e1707dbc4b0a9f80'
         'baa2859f793a797b6e22525b0a74091c')

build() {
  cd ${srcdir}/${pkgname}/source
  CC=gcc make -f ${srcdir}/Makefile
}

package() {
  cd ${srcdir}/${pkgname}/source
  mkdir -p ${pkgdir}/usr/{lib,include/gctpc}
  install -Dm644 ${srcdir}/${pkgname}/source/proj.h ${pkgdir}/usr/include/gctpc
  install -Dm644 ${srcdir}/${pkgname}/source/cproj.h ${pkgdir}/usr/include/gctpc
  install -Dm644 ${srcdir}/${pkgname}/source/libgeo.a ${pkgdir}/usr/lib
}
