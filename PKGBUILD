# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=emos
pkgver=4.5.9
pkgrel=1
pkgdesc="ECMWF Interpolation Library"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/EMOS/Emoslib"
license=('Apache')
groups=(science)
depends=()
makedepends=(eccodes boost git cmake)
options=('staticlibs')
source=(https://software.ecmwf.int/wiki/download/attachments/3473472/libemos-${pkgver}-Source.tar.gz)
md5sums=('693ca9285127800347d3fb6ccb485343')

build() {
  cd ${srcdir}/lib${pkgname}-${pkgver}-Source
  sed -i CMakeLists.txt -e 's/ecbuild_add_option\(.*\)INSTALL_TOOLS\(.*\)DEFAULT ON )/ecbuild_add_option\1INSTALL_TOOLS\2DEFAULT OFF )/'
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
