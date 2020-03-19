# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=gctpc
pkgver=20a
pkgrel=3
pkgdesc="Software library for geolocation written by the USGS"
arch=("i686" "x86_64")
url="https://www.ngs.noaa.gov/PUBS_LIB/GeneralCartographicTransformationPackage_v2_TR_NOS124_CGS9.pdf"
options=('staticlibs')
license=('custom')
source=(http://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz.v2.0.8
        Makefile)
md5sums=('3d56cbed5de8c460d304bf2206abc8d3'
         'baa2859f793a797b6e22525b0a74091c')

build() {
  cd ${srcdir}/grib2
  tar zxvf gctpc20a.tgz
  cd ${pkgname}/source
  CC=gcc make -f ${srcdir}/Makefile
}

package() {
  cd ${srcdir}/grib2/${pkgname}/source
  mkdir -p ${pkgdir}/usr/{lib,include/gctpc,share/licenses/gctpc}
  base=${srcdir}/grib2/${pkgname}
  install -Dm644 ${base}/source/proj.h ${pkgdir}/usr/include/gctpc
  install -Dm644 ${base}/source/cproj.h ${pkgdir}/usr/include/gctpc
  install -Dm644 ${base}/source/libgeo.a ${pkgdir}/usr/lib
  install -Dm644 ${base}/announce.txt ${pkgdir}/usr/share/licenses/gctpc/licence
}
