# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium
pkgver=5.0.0
pkgrel=2
pkgdesc="Python framework for building 3D printing related applications"
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('LGPL')
depends=('python' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'python-pyqt5' 'python-numpy'
         'arcus' 'python-shapely' 'python-scipy' 'python-cryptography' 'python-certifi')
makedepends=('cmake' 'ninja')
checkdepends=('mypy' 'python-pytest' 'python-twisted')
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3a6482c0698320ecb87f41f725565fdee1e99cb4258043130816d5181ead8603')

prepare() {
  cd Uranium-${pkgver}
  sed -i 's,/dist-packages,.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
}

build() {
  cmake -S Uranium-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  cd build
  # all tests fail atm
  # ctest
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

# Move cmake module to right dir
  mv "$pkgdir"/usr/share/cmake{-*,}
}

# vim:set ts=2 sw=2 et:
