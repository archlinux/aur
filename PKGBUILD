# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow
pkgver=5.19.0
pkgrel=1
pkgdesc="ecFlow - workflow manager from ECMWF"
arch=(i686 x86_64)
url="https://confluence.ecmwf.int/display/ECFLOW"
license=('APACHE 2.0')
groups=(science)
depends=(qt5-base qt5-charts qt5-svg python git pybind11)
makedepends=(cmake boost)
provides=()
conflicts=(ecflow-ui ecflow4)
replaces=()
backup=()
options=()
install=
source=(https://confluence.ecmwf.int/download/attachments/8650755/ecFlow-5.19.0-Source.tar.gz)
noextract=()
sha256sums=('84c7efe001ff293498d8313440c91f57596cd404d3391c5ed8777888b32e55e7')

build() {
  pwd
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-w -DENABLE_SERVER=on -DENABLE_PYTHON=on -DENABLE_UI=on -DENABLE_GUI=off \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DBOOST_ROOT=/usr \
    -DCMAKE_CXX_COMPILER=g++ \
    ../ecFlow-${pkgver}-Source
  make -j$(grep processor /proc/cpuinfo | wc -l) || return 1
}

package()
{
  cd build
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
