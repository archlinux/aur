# Maintainer: Anton T Johansson <anton@tetov.se>
# Contributor: GPereira
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=uranium-beta-git
pkgver=4.0
pkgrel=2
pkgdesc="A Python framework for building Desktop applications."
arch=('any')
url="https://github.com/Ultimaker/Uranium"
license=('LGPL3')
depends=('arcus-beta-git'
         'pyqt5-common'
         'python'
         'python-numpy'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'python-pyqt5')
makedepends=('cmake' 'git')
provides=('uranium')
conflicts=('uranium' 'uranium-beta')
source=("git+${url}#branch=${pkgver}")
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
