pkgname=python-openmm
_pkgname=openmm
pkgver=7.0.1
pkgrel=1
pkgdesc="Python bindings for openmm"
arch=('i686' 'x86_64')
url="https://simtk.org/home/openmm"
license=('MIT' 'LGPL')
depends=('fftw')
makedepends=('cmake' 'swig')
depends=('openmm')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz")
md5sums=('f2ace25db6755eb91039149a1b8031b9')

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
