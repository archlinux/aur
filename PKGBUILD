# Maintainer: Robin Nehls <aur@manol.is>

pkgname=gr-fosphor-git
pkgver=4ae2f53
pkgrel=1
pkgdesc="GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration"
arch=('any')
url="http://sdr.osmocom.org/trac/wiki/fosphor"
license=(unknown)
depends=('gnuradio' 'boost' 'swig' 'glfw' 'opencl-headers' 'freetype2')
makedepends=('cmake')
provides=('gr-fosphor')
source=('git://git.osmocom.org/gr-fosphor'
        '0001-add-subpath-for-freetype.patch')
sha1sums=('SKIP'
          '2567e84a022a456655e10f0560365b38abef19c4')
_gitname=gr-fosphor

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd $_gitname
  patch -p1 -i $srcdir/0001-add-subpath-for-freetype.patch
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
