pkgname=python-openmm
_pkgname=openmm
pkgver=7.0.1
pkgrel=2
pkgdesc="Python bindings for openmm"
arch=('i686' 'x86_64')
url="https://simtk.org/home/openmm"
license=('MIT' 'LGPL')
depends=('fftw')
makedepends=('cmake' 'swig')
depends=('openmm')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz")
sha512sums=('3a07148f3d00121d3a6cbf94513804453a947fd7e826a2d7fdf011e1d1fb9406a26a42d5bae8f35728c9877e63deb3b564868e56cce58ef0ac28f53f950d2512')

prepare() {
  mkdir -p build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  sed -i 's:setup.py install:setup.py install --root=$DESTDIR:g' wrappers/python/pysetupinstall.cmake
  make DESTDIR=${pkgdir} PythonInstall
}
