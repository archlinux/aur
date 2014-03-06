# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=simbody
pkgver=3.3.1
pkgrel=2
pkgdesc="High-performance C++ multibody dynamics/physics library for simulating articulated biomechanical and mechanical systems like vehicles, robots, and the human skeleton."
arch=('i686' 'x86_64')
url="https://simtk.org/home/simbody"
license=('Apache')
depends=('lapack' 'blas')
optdepends=('freeglut' 'libxi' 'libxmu')
makedepends=('git' 'cmake')
provides=()
conflicts=()

_dir=Simbody
_tag=Simbody-${pkgver}
source=("${_dir}"::"git+https://github.com/simbody/simbody.git"#tag=${_tag})
md5sums=('SKIP')


build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/simbody
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install

  ln -s ${pkgdir}/opt/simbody/bin/VisualizerGUI ${pkgdir}/opt/simbody/examples/bin/VisualizerGUI
}
