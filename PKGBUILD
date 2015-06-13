# based on http://repos.archlinux.org/wsvn/packages/hdf5/trunk/PKGBUILD
# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=libhdf5
real_pkgname=hdf5
pkgver=1.8.15
_pkgver=1.8.15
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="HDF5 - static library"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
options=('!libtool')
source=(ftp://ftp.hdfgroup.org/HDF5/releases/${real_pkgname}-${_pkgver}/src/${real_pkgname}-${_pkgver}.tar.bz2)
md5sums=('c3cfd7aeca8ca15160d9784af6748ac4')

build() {
  cd $srcdir/${real_pkgname}-${_pkgver/_/-}
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  
  ./configure --prefix=/usr \
    --enable-hl \
    --enable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make || return 1
}

package() {
  install -d -m755 $pkgdir/usr/lib
  install -m644 $srcdir/${real_pkgname}-${_pkgver/_/-}/src/.libs/libhdf5.a $pkgdir/usr/lib/
  install -m644 $srcdir/${real_pkgname}-${_pkgver/_/-}/hl/src/.libs/libhdf5_hl.a $pkgdir/usr/lib/
}

