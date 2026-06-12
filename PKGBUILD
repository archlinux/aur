pkgname=openmodelica-omc
pkgver=1.26.9
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
_giturl="https://github.com/OpenModelica/OpenModelica.git"
groups=(openmodelica)
conflicts=(openmodelica)
depends=('lapack' 'java-environment')
makedepends=('gcc-fortran' 'cmake' 'boost')
options=('!lto')
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-v${pkgver}-src-with-submodules.zip")
sha256sums=('9891ba8233af63b3b503cb0362785089d64402b7894928f5e056521569a2aadc')

prepare() {
  cd "$srcdir/OpenModelica-v${pkgver}"
}

build() {
  cd "$srcdir/OpenModelica-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_ENABLE_GUI_CLIENTS=OFF -B build .
  make -C build
}

package() {
  cd "$srcdir/OpenModelica-v${pkgver}"
  make install -C build DESTDIR="${pkgdir}"
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/home
}
