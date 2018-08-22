# Maintainer : George Eleftheriou <eleftg>
# Contributor: Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Frisbee Whisperwind <Frisbee>

_pkgname=hdf5
pkgname=libhdf5
pkgver=1.10.3
pkgrel=1
arch=('x86_64')
pkgdesc="the static libraries of HDF5"
url="https://portal.hdfgroup.org/display/support"
license=('custom')
depends=('zlib' 'libaec')
makedepends=('time' 'gcc-fortran')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('56c5039103c51a40e493b43c504ce982')

prepare() {
    [ ! -d build ] && mkdir -p build
}

build() {
    cd build
  
    "${srcdir}/${_pkgname}-${pkgver}"/configure \
        --prefix=/usr \
        --disable-sharedlib-rpath \
        --disable-shared \
        --docdir=/usr/share/doc/hdf5/ \
        --enable-static \
        --enable-build-mode=production \
        --enable-hl \
        --enable-cxx \
        --enable-fortran \
        --with-pic \
        --with-zlib \
        --with-szlib

    make
}

check() {
    cd build
    make check
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/{bin,include,share}
    rm -rf "${pkgdir}"/usr/lib/libhdf5.settings
}

