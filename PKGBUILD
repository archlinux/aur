# based on https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/hdf5
# Maintainer: Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=libhdf5
real_pkgname=hdf5
pkgver=1.10.1
_pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="HDF5 - static library"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'bash')
makedepends=('time' 'gcc-fortran')
source=(ftp://ftp.hdfgroup.org/HDF5/releases/${real_pkgname}-${_pkgver}/${real_pkgname}-${pkgver}/src/${real_pkgname}-${pkgver}.tar.bz2)
md5sums=('d89893c05ee7ea8611b51bb39450d64e')

build() {
  cd ${real_pkgname}-${pkgver}
  
  ./configure \
    --prefix=/usr \
    --enable-hl \
    --disable-threadsafe \
    --enable-linux-lfs \
    --enable-build-mode=production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath \
    --enable-cxx \
    --enable-fortran \
    --with-zlib
  make
}

package() {
  install -d -m755 $pkgdir/usr/lib
  install -m644 ${real_pkgname}-${pkgver/_/-}/src/.libs/libhdf5.a $pkgdir/usr/lib/
  install -m644 ${real_pkgname}-${pkgver/_/-}/hl/src/.libs/libhdf5_hl.a $pkgdir/usr/lib/
}

