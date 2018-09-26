# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium-beta
pkgver=3.5
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('AGPL')
depends=('python' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus-beta')
makedepends=('cmake')
conflicts=('uranium' 'uranium-git')
source=("git+https://github.com/Ultimaker/Uranium#branch=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd Uranium
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt
}

build() {
  cd Uranium
  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Uranium/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
