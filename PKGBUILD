# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=embree-bvh_build-git
pkgver=7289.1b82e55
pkgrel=1
pkgdesc="Custom version of Embree exposing BVH builder for use with luxrays"
arch=('x86_64')
url="https://github.com/Dade916/embree/tree/bvh_build"
license=('Apache')
depends=('intel-tbb')
provides=('embree')
conflicts=('embree')
makedepends=('cmake' 'ispc' 'freeglut' 'libxmu' 'openexr' 'git')
source=('git+https://github.com/Dade916/embree.git#branch=bvh_build')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/embree"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/embree"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TUTORIALS=OFF
#    -DXEON_ISA="SSE2"
  make
}

package() {
  cd "$srcdir/embree"
  make DESTDIR="$pkgdir" install
}

