# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libaacs-git
pkgver=0.9.0.7.g5486058
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
sha1sums=('SKIP')

pkgver() {
  cd libaacs
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libaacs
  ./bootstrap
}

build() {
  cd libaacs
  ./configure \
    --prefix=/usr

  make
}

package() {
  make -C libaacs DESTDIR="${pkgdir}" install
}
