# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=python2-pynio
pkgver=1.4.1
pkgrel=1
pkgdesc="PyNIO is a Python programming language module that allows read and/or write access to a variety of data formats using an interface modelled on netCDF."
url="http://www.pyngl.ucar.edu/Nio.shtml"
license=('custom:PyNIO Source Code License')
arch=('i686' 'x86_64')
depends=('netcdf' 'hdf5' 'hdf-eos2' 'hdf-eos5' 'hdf4-nonetcdf' 'python2' 'g2clib' 'gdal')
makedepends=('glibc' 'gcc' 'gcc-fortran' 'libjpeg' 'jasper' 'zlib' 'unzip')
provides=('pynio')
source=("http://dl.dropbox.com/u/3383807/PyNIO-${pkgver}.tar.gz")
md5sums=('eec7b6b7ed960de253632d0636d0cc2d')

package() {
  
  cd $srcdir/PyNIO-${pkgver}
  
  export HAS_GDAL=1
  export HAS_GRIB2=1
  export HAS_HDFEOS=1
  export HAS_HDFEOS5=1
  export HAS_NETCDF=1
  export HAS_NETCDF4=1
  export HAS_OPENDAP=1

  export F2CLIBS=gfortran
  export F2CLIBS_PREFIX=/usr/lib
  export GRIB2_PREFIX=/usr/lib
  export HDFEOS_PREFIX=/usr/lib
  export HDFEOS5_PREFIX=/usr/lib
  export NETCDF_PREFIX=/usr/lib
  export NETCDF4_PREFIX=/usr/lib

  sed -i "s|hdf/||g" libsrc/NclHDFEOS.c
  sed -i "s|hdf/||g" libsrc/NclHDFEOS5.c
  sed -i "s|hdf/||g" libsrc/NclHDF.c
  
  python2 setup.py install --root=${pkgdir}

  rm -rf ncarg/data/
  cp -R ncarg ${pkgdir}/usr/lib/python2.?/site-packages/PyNIO/
  
}
