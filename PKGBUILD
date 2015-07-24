# Maintainer: David Edmundson

pkgbase=telepathy-hanging-git
pkgname=('telepathy-hanging-git')
pkgver=r12.ab43734
pkgrel=1
pkgdesc="Telepathy Connection Manager for Google Talk"
arch=('i686' 'x86_64')
url="https://github.com/tiagosh/telepathy-hanging/"
license=('GPL')
makedepends=('cmake' 'git')
source=("git+https://github.com/tiagosh/telepathy-hanging")
md5sums=('SKIP')

pkgver() {
  cd telepathy-hanging
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telepathy-hanging \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
}

package_telepathy-hanging-git() {
  depends=('telepathy-qt5' 'libhangish-git')
  cd build
  make DESTDIR="$pkgdir" install
}

