pkgname=chronoengine-git
pkgver=r5341.96806cd
pkgrel=1
pkgdesc="C++ library for physics simulation"
license=('custom')
arch=('i686' 'x86_64')
url="http://projectchrono.org/chronoengine/"
depends=('gcc-libs')
makedepends=('cmake')
conflicts=("chronoengine")
provides=("chronoengine")
source=("git+https://github.com/projectchrono/chrono.git")
sha1sums=('SKIP')

pkgver() {
  cd chrono
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd chrono
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DBUILD_DEMOS=OFF \
        -DBUILD_ADDITIONAL_TESTS=OFF \
        ..
  make
}

package() {
  cd chrono/build
  make DESTDIR="$pkgdir" install
}

