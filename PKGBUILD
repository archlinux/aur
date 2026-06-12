pkgname=openmodelica
pkgver=1.26.9
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
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-v${pkgver}-src-with-submodules.zip")
sha256sums=('9891ba8233af63b3b503cb0362785089d64402b7894928f5e056521569a2aadc')

prepare() {
  cd "OpenModelica-v${pkgver}"
}

build() {
  cd "OpenModelica-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_QT_MAJOR_VERSION=6 -B build .
  make -C build
}

package() {
  cd "OpenModelica-v${pkgver}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/home
}
