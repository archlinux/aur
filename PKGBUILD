# Maintainer: Q. Guo <guotsuan@gmail.com>

pkgname=hdf5-fortran-cxx
_pkgname=hdf5
pkgver="1.8.16"
_pkgver="1.8.16"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data with GNU gfortran and GNU C++ support enabled, but without threadsafe."
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
conflicts=(hdf5)
depends=('zlib' 'sh'  'gcc'  'gcc-fortran')
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${_pkgver}.tar.bz2)
#source=(http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.8/src/${_pkgname}-${pkgver}.tar.bz2)
options=('!libtool')
sha1sums=('a7b631778cb289edec670f665d2c3265983a0d53')
provides=('hdf5')

build() {
  cd $srcdir/${_pkgname}-${_pkgver}
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  ./configure --prefix=/usr \
      FC=gfortran  \
      CXX=g++ \
    --enable-fortran \
    --enable-fortran2003 \
    --enable-cxx \
    --enable-hl \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd $srcdir/${_pkgname}-${_pkgver}

  make -j1 DESTDIR=${pkgdir} install

  install -d -m755 $pkgdir/usr/share/licenses/${_pkgname}
  install -m644 $srcdir/${_pkgname}-${_pkgver}/COPYING \
          $pkgdir/usr/share/licenses/${_pkgname}/LICENSE 
}


