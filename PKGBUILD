# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=metview
pkgver=4.6.6
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=( 'magics++>=2.22' mksh openmotif netcdf-cxx-legacy grib_api qtwebkit libxpm)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz c++.patch)
noextract=()
md5sums=('897c2ec36a0d36a6a9827817a1fafbe2'
         'ab0719eee5c21164747f715a953ec01a')

build() {
  cd Metview-${pkgver}-Source
  patch -p0 -i ${srcdir}/c++.patch
  mkdir -p build && cd build
  cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_CC_COMPILER=gcc \
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
