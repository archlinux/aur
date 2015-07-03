# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=yafaray
pkgver=0.1.5
pkgrel=1
pkgdesc="A free open-source montecarlo raytracing engine"
arch=('i686' 'x86_64')
url="http://yafaray.org/"
license=('LGPL2.1')
depends=('libxml2' 'libjpeg' 'libpng' 'openexr' 'freetype2' 'zlib' 'qt4')
optdepends=('python: Python bindings')
makedepends=('cmake' 'swig' 'python')
source=("https://github.com/YafaRay/Core/archive/${pkgver}.tar.gz")
md5sums=('31202a7bee930b2698c665ef6513bd7b')

build() {
  cd "${srcdir}/Core-${pkgver}"

  # Delete the build directory if it exists to avoid confusion caused by CMake's caches
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DYAF_PY_VERSION=3.4 \
        -DYAF_BINDINGS_PY_DIR=/usr/lib/python3.4 ..
  make
}

package() {
  cd "${srcdir}/Core-${pkgver}/build"

  make DESTDIR=$pkgdir install
}
