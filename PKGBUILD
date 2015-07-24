# Maintainer: David Edmundson

pkgbase=libhangish-git
pkgname=('libhangish-git')
pkgver=r38.6dd0237
pkgrel=1
pkgdesc="Qt library for Google Talks"
arch=('i686' 'x86_64')
url="https://github.com/tiagosh/libhangish/"
license=('GPL')
makedepends=('cmake' 'git')
source=("git+https://github.com/tiagosh/libhangish/")
md5sums=('SKIP')

pkgver() {
  cd libhangish
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libhangish \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
}

package_libhangish-git() {
  depends=()
  cd build
  make DESTDIR="$pkgdir" install
}

