# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libudfread-git
pkgver=0.0.0.25.g50d41b1
pkgrel=1
pkgdesc="UDF reader. (GIT version)"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://git.videolan.org/?p=libudfread.git;a=summary'
depends=('glibc')
makedepends=('git')
provides=('libudfread' 'libudfread.so')
conflicts=('libudfread')
source=('git+https://git.videolan.org/git/libudfread.git')
sha1sums=('SKIP')

pkgver() {
  cd libudfread
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libudfread
  ./bootstrap
}

build() {
  cd libudfread
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  make -C libudfread DESTDIR="${pkgdir}" install
}
