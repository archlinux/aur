# Maintainer: Salamandar <felix@piedallu.me>


pkgname=freecad-linkstage3-git
pkgver=asm3.0.5.3.r1537.g234333df9
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - LinkStage3 dev branch, git checkout'
arch=('any')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=(
  # doxygen

  'python-pyside'

  'boost-libs'

  'calculix'
  'coin'
  'gmsh'
  'med'
  'netgen-git'
  'opencascade'
  'vtk'


  # libqtcore4
  # libshiboken-dev
  # libxerces-c-dev
  # libxmu-dev
  # libxmu-headers
  # libxmu6
  # libxmuu-dev
  # libxmuu1
  # libqtwebkit-dev
  # python-pivy
  # python-matplotlib


  # automake
  # dictionaries-common
  # tcl8.5-dev
  # tk8.5-dev
  # libcoin80-dev
  # libhdf5-dev
  # libfreetype6-dev
  # python-dev
  # qt4-dev-tools
  # qt4-qmake
)
makedepends=(
  'cmake' 'ninja'
  'gcc-fortran'
  'desktop-file-utils'
  'python-pyside-tools'
  'swig'
  'boost'
  'eigen'
)
optdepends=(

)
_gitname='FreeCAD'
source=(
  "git+https://github.com/realthunder/FreeCAD.git#branch=LinkStage3"
)
sha256sums=(
  'SKIP'
)


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

build() {
  cd "${srcdir}/${_gitname}"

  mkdir build -p
  pushd build >/dev/null

  cmake .. \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DOCC_INCLUDE_DIR='/usr/include/opencascade' \
    -DOCC_LIBRARY_DIR='/usr/lib' \
    -DOpenCASCADE_DIR='/usr/lib/cmake/opencascade' \
    -DFREECAD_USE_OCC_VARIANT="Official Version" \
    -DBUILD_FEM_NETGEN=OFF \
    -DBUILD_QT5=ON \
    -G Ninja

  ninja
}

package() {
  ninja install
  ln -sf /opt/FreeCAD/bin/FreeCAD /usr/bin/freecad-git
}
