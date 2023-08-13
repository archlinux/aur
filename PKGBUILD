# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=gr-fosphor-git
pkgver=r133.7b6b996
pkgrel=2
pkgdesc="GNU Radio block for RTSA-like spectrum visualization using OpenCL and OpenGL acceleration"
arch=('any')
url="https://osmocom.org/projects/sdr/wiki/fosphor"
license=('GPL3')
depends=('gnuradio' 'pybind11' 'boost-libs' 'glfw' 'ocl-icd' 'freetype2')
makedepends=('git' 'cmake' 'boost' 'opencl-headers')
provides=('gr-fosphor')
source=('git+https://gitea.osmocom.org/sdr/gr-fosphor.git')
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
