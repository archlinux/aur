# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libaacs-git
pkgver=0.11.1.12.g37b8a48
pkgrel=1
pkgdesc="Advanced Access Content System. (GIT version)"
arch=('x86_64')
license=('LGPL')
url='https://www.videolan.org/developers/libaacs.html'
depends=('libgcrypt'
         'libudfread.git'
         )
makedepends=('git'
             'flex'
             'bison'
             'libudfread-git'
             )
provides=('libaacs'
          'libaacs.so'
          )
conflicts=('libaacs')
source=('git+https://code.videolan.org/videolan/libaacs.git')
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
