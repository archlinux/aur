# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=2.0.2
pkgrel=1
pkgdesc="A program to manipulate, inventory and decode GRIB-2 files"
arch=('i686' 'x86_64')
url="http://www.cpc.noaa.gov/products/wesley/wgrib2/"
license=('custom')
depends=('netcdf' 'jasper' 'libpng' 'libmariadbclient' 'proj')
makedepends=('g2clib' 'gctpc')
source=(ftp://ftp.cpc.ncep.noaa.gov/wd51we/${pkgname}/${pkgname}_nolib.tgz.v${pkgver}
        wgrib2.patch)
md5sums=('d423ff205f9c61b9ad8f6c0cd99f70b9'
         '88cf8f897294b6db3f8f53ca1a847cd8')

build() {
  cd ${srcdir}/grib2
  patch -p0 -i ${srcdir}/wgrib2.patch
  FC=gfortran F90=gfortran F77=gfortran make
}

package()
{
  cd ${srcdir}/grib2
  install -Dm755 ${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}/LICENSE-${pkgname} \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
