# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=docopt.cpp-git
pkgver=0.6.3.r5.g400e6dd
pkgrel=1
pkgdesc="C++11 port of docopt"
arch=('i686' 'x86_64')
url="https://github.com/docopt/docopt.cpp/"
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('docopt')
provides=('docopt')
source=("docopt.cpp-git::git+https://github.com/docopt/docopt.cpp.git")
sha512sums=('SKIP')

pkgver() {
  cd "docopt.cpp-git"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v\(.*\)/\1/'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../docopt.cpp-git \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON
  cmake --build .
}

package() {
  DESTDIR="${pkgdir}" cmake --build build -t install
  cd docopt.cpp-git
  install -Dm644 LICENSE-MIT ${pkgdir}/usr/share/licenses/docopt.cpp-git/LICENSE
}
