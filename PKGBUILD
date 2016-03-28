# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=emos
pkgver=4.3.9
pkgrel=1
pkgdesc="ECMWF Interpolation Library"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/EMOS/Emoslib"
license=('Apache')
groups=(science)
depends=()
makedepends=(grib_api boost git cmake)
options=('staticlibs')
source=(https://software.ecmwf.int/wiki/download/attachments/3473472/libemos-${pkgver}-Source.tar.gz)
md5sums=('1761b806f771acaaac6a97e40dae7bb9')

build() {
  cd ${srcdir}/lib${pkgname}-${pkgver}-Source
  mkdir -p build
  cd build
  cmake -DGRIB_API_PATH=/usr \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/lib${pkgname}-${pkgver}-Source/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
