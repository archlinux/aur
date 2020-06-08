# Maintainer: León Bohn <leon.bohn@rwth-aachen.de>

pkgname=oink-git
pkgrel=1
pkgver=r114.f80978d
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgdesc="Oink is an implementation of modern parity game solvers written in C++."
arch=('i686' 'x86_64')
url="https://github.com/trolando/oink"
licecnse=('Apache 2.0')
source=("oink-git::git+https://github.com/trolando/oink#commit=f80978d")
makedepends=('git' 'gcc' 'make' 'cmake' 'boost')
depends=('boost-libs')
md5sums=('SKIP')


build() {
  cd $pkgname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR=${pkgdir} install
}
