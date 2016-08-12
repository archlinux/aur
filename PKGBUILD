# Maintainer: Robin Nehls <aur@manol.is>

pkgname=gr-fosphor-git
pkgver=r133.7b6b996
pkgrel=1
pkgdesc="GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration"
arch=('any')
url="http://sdr.osmocom.org/trac/wiki/fosphor"
license=(unknown)
depends=('gnuradio' 'boost' 'swig' 'glfw' 'opencl-headers' 'freetype2')
makedepends=('cmake')
provides=('gr-fosphor')
source=('git://git.osmocom.org/gr-fosphor')
sha1sums=('SKIP')
_gitname=gr-fosphor

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
