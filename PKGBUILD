# based on http://repos.archlinux.org/wsvn/packages/hdf5/trunk/PKGBUILD
# Maintainer: Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=libhdf5
real_pkgname=hdf5
pkgver=1.10.0
_pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="HDF5 - static library"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
options=('!libtool')
source=(ftp://ftp.hdfgroup.org/HDF5/releases/${real_pkgname}-${_pkgver}/${real_pkgname}-${pkgver}/src/${real_pkgname}-${pkgver}.tar.bz2)
md5sums=('355243bda5df386aea25f079d550947b')

build() {
  cd $srcdir/${real_pkgname}-${pkgver}
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  
  ./configure --prefix=/usr \
    --enable-hl \
    --disable-threadsafe \
    --enable-linux-lfs \
    --enable-build-mode=production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make || return 1
}

package() {
  install -d -m755 $pkgdir/usr/lib
  install -m644 $srcdir/${real_pkgname}-${pkgver/_/-}/src/.libs/libhdf5.a $pkgdir/usr/lib/
  install -m644 $srcdir/${real_pkgname}-${pkgver/_/-}/hl/src/.libs/libhdf5_hl.a $pkgdir/usr/lib/
}

