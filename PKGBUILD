# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libaacs-git
pkgver=0.9.0.20.ga31f175
pkgrel=1
pkgdesc="Advanced Access Content System. (GIT version)"
arch=('x86_64')
license=('LGPL')
url='http://www.videolan.org/developers/libaacs.html'
depends=('libgcrypt')
makedepends=('git'
             'flex'
             'bison'
             )
provides=('libaacs'
          'libaacs.so'
          )
conflicts=('libaacs')
source=('git+https://git.videolan.org/git/libaacs.git')
sha256sums=('SKIP')

pkgver() {
  cd libaacs
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd libaacs
  autoreconf -vfi
}

build() {
  cd build
  ../libaacs/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
