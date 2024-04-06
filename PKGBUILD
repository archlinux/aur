# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: neodarz <neodarz@neodarz.net>

pkgname=libsavitar
pkgver=5.3.0
pkgrel=0.1
pkgdesc="C++ implementation of 3mf loading with SIP python bindings"
arch=('x86_64')
url="https://github.com/Ultimaker/libsavitar"
license=('AGPL')
depends=('python' 'pugixml')
makedepends=(
  'cmake'
  'ninja'
  'python-pyqt5-sip'
  'sip'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/libSavitar//archive/${pkgver}.tar.gz)
b2sums=('fa9c745c6f86940e87e99b08d7ddbc933fe5e56cac583da9ecb7673efc7ce63de4be9729f4108e1de9867bd1d4cad311da6c2c3707d9ab075dcf873cc41a0bad')

prepare() {
  cd "libSavitar-${pkgver}"
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt
}

build() {
  cd "libSavitar-${pkgver}"
  mkdir  build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "libSavitar-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
