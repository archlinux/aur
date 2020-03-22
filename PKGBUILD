# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbdplus-git
pkgver=0.1.2.35.g1472680
pkgrel=1
pkgdesc="Open implementation of BD+ protocol. (GIT version)"
arch=('x86_64')
license=('LGPL')
url='http://www.videolan.org/developers/libbdplus.html'
depends=('libaacs')
makedepends=('git')
provides=('libbdplus'
          'libbdplus.so'
          )
conflicts=('libbdplus')
source=('git+https://code.videolan.org/videolan/libbdplus.git')
sha256sums=('SKIP')

pkgver() {
  cd libbdplus
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd libbdplus
  autoreconf -vfi
}

build() {
  cd build
  ../libbdplus/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
