
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=xdmf
pkgver=2.1
pkgrel=1
pkgdesc="Extensible Data Model and Format "
arch=('i686' 'x86_64')
url="http://www.xdmf.org/"
license=('unknown')
depends=('openmpi' 'hdf5')
makedepends=('cmake' 'gcc-fortran')

source=("$pkgname-$pkgver.tar.gz::http://ftp.us.debian.org/debian/pool/main/x/${pkgname}/${pkgname}_${pkgver}.dfsg.1.orig.tar.gz")
sha256sums=('fb53e4ffbcb1e1e0446f4732602fe91b4279c0e32aa6a440a8d871a1a11fa109')

prepare()
{
    cd "${srcdir}/$pkgname-$pkgver.dfsg.1"
    mkdir -p build
    cd build
    cmake .. -DXDMF_USE_BZIP2:BOOL="1" -DCMAKE_INSTALL_PREFIX:PATH="/usr" -DHDF5_INCLUDE_PATH:PATH="/usr/include" -DXDMF_SYSTEM_ZLIB:BOOL="1" -DXDMF_SYSTEM_HDF5:BOOL="1" -DXDMF_USE_GZIP:BOOL="1" -DXDMF_SYSTEM_LIBXML2:BOOL="1" -Wno-dev
}

build()
{
    cd "${srcdir}/$pkgname-$pkgver.dfsg.1/build"
    make -j$(nproc)
}

package()
{
    cd "${srcdir}/$pkgname-$pkgver.dfsg.1/build"
    make DESTDIR="${pkgdir}" install
}