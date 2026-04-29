pkgname=openmodelica
pkgver=1.26.5
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt6-webengine' 'qt6-svg' 'qt6-tools' 'qt6-5compat')
provides=('openmodelica-omc')
makedepends=('gcc-fortran' 'cmake' 'boost')
options=('!lto')
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-src-with-submodules.zip")
sha256sums=('8c26ae68db79e2ac5445fa400ec1a06cb3286d1d368d3e2f0cacf1caaadee9c3')

prepare() {
  cd "${pkgname}"
}

build() {
  cd "${pkgname}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_QT_MAJOR_VERSION=6 -DBLA_VENDOR=Generic -B build .
  make -C build
}

package() {
  cd "${pkgname}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/home
}
