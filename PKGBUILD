# Contributor: Martin Grønlien Pejcoch <mpejcoch@gmail.com>
pkgname=ecflow
pkgver=5.13.6
pkgrel=1
pkgdesc="ecFlow - workflow manager from ECMWF"
arch=(i686 x86_64)
url="https://confluence.ecmwf.int/display/ECFLOW"
license=('APACHE 2.0')
groups=(science)
depends=(qt5-base qt5-charts qt5-svg python git)
makedepends=(cmake boost)
provides=()
conflicts=(ecflow-ui ecflow4)
replaces=()
backup=()
options=()
install=
source=(https://confluence.ecmwf.int/download/attachments/8650755/ecFlow-${pkgver}-Source.tar.gz)
noextract=()
sha256sums=('11e1b693fc8f6aa834fc5a9c34503573f6391464b1c21d5023e4726c79aa9df1')

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
