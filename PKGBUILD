# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=metview
pkgver=5.0.1
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=( 'magics++>=3.0.0' mksh openmotif netcdf-cxx-legacy eccodes qtwebkit libxpm)
makedepends=('emos>=4.0.5')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz)
noextract=()
md5sums=('f34d21f7da0b0d316693c6f10a5b3da9')

build() {
  cd Metview-${pkgver}-Source
  mkdir -p build && cd build
  cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=/usr/bin/gcc \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share -DENABLE_QT5=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 ..
  make || return 1
}

package()
{
  cd Metview-${pkgver}-Source/build
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
