# Maintainer: Adrian Sausenthaler <aur@sausenthaler.de>

pkgname=openpgl-git
pkgver=0.4.0
pkgrel=1
pkgdesc="Intel Open Path Guiding Library. Algorithms for more efficient ray tracing renderings."
arch=('x86_64')
url="https://github.com/openpathguidinglibrary/openpgl"
license=('Apache')
depends=('embree')
makedepends=('cmake' 'make' 'gcc')
provides=("openpgl")
source=("git+https://github.com/openpathguidinglibrary/openpgl.git")
md5sums=('SKIP')
install=

prepare() {
  mkdir "$srcdir/build"
}

build() {
  cd build
  cmake \
	-Wno-dev \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DOPENPGL_BUILD_STATIC=OFF \
	-DCMAKE_BUILD_TYPE=Release \
	../openpgl

  cmake --build .
}

package() {
  cd build
  cmake --install openpgl --prefix "$pkgdir/usr"
}
