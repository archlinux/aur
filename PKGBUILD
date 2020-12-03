# Maintainer: Fabrice aneche <akh at nobugware dot com>

pkgname=s2geometry-git
pkgver=r558
pkgrel=1
pkgdesc="Computational geometry and spatial indexing on the sphere"
arch=('i686' 'x86_64')
url="https://s2geometry.io/"
license=('APACHE2')
depends=('openssl' 'python')
makedepends=('git' 'cmake' 'swig')
source=("git+https://github.com/google/s2geometry.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/s2geometry"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/s2geometry"
  mkdir -p build
  cd build
  cmake -DGTEST_ROOT= -DCMAKE_INSTALL_PREFIX=/usr  ..
  make
}

package() {
  cd "$srcdir/s2geometry/build"
  make DESTDIR="$pkgdir/" install
}

