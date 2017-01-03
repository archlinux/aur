# Maintainer: AppleBloom <rat.o.drat@gmail.com>

pkgname='yafaray-experimental'
_pkgver='3.1.1-beta'
pkgver='3.1.1'
pkgrel='1'
pkgdesc='A free open-source montecarlo raytracing engine.'
arch=('i686' 'x86_64')
url='http://yafaray.org/'
license=('LGPL2.1')
depends=('libxml2' 'libjpeg' 'libpng' 'libtiff' 'openexr' 'freetype2' 'zlib')
makedepends=('cmake' 'swig' 'python')
optdepends=('python: Python bindings'
            'yafaray-experimental-blender-exporter: For rendering in Blender.')
provides=('yafaray')
conflicts=('yafaray' 'yafaray-git')
source=("https://github.com/DavidBluecame/Core/archive/v$_pkgver.tar.gz")
md5sums=('affda06b851ae20a4bcf65fc2d7684f8')

_srcdir="Core-$_pkgver"

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
