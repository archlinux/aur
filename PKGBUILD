# Maintainer: AppleBloom <rat.o.drat@gmail.com>

pkgname='yafaray-experimental'
pkgver='2.1.1'
pkgrel='1'
pkgdesc='A free open-source montecarlo raytracing engine.'
arch=('i686' 'x86_64')
url='http://yafaray.org/'
license=('LGPL2.1')
depends=('libxml2' 'libjpeg' 'libpng' 'libtiff' 'openexr' 'freetype2' 'zlib')
makedepends=('cmake' 'swig' 'python')
optdepends=('python: Python bindings')
provides=('yafaray')
conflicts=('yafaray' 'yafaray-git')
source=('https://github.com/DavidBluecame/Core/archive/v2.1.1.tar.gz')
md5sums=('1d0541629c48944e8a397d4ea4d2ccee')

_srcdir="Core-$pkgver"

build() {
  cd "$_srcdir"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DYAF_PY_VERSION=3.5 \
        -DYAF_BINDINGS_PY_DIR=/usr/lib/python3.5 ..
  make
}

package() {
  cd "$_srcdir/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
