# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libudfread-git
pkgver=1.0.0.32.g09059bb
pkgrel=1
pkgdesc="UDF reader. (GIT version)"
arch=('x86_64')
license=('LGPL2.1')
url='http://git.videolan.org/?p=libudfread.git;a=summary'
depends=('glibc')
makedepends=('git')
provides=('libudfread'
          'libudfread.so'
          )
conflicts=('libudfread')
source=('git+https://code.videolan.org/videolan/libudfread.git')
sha256sums=('SKIP')

pkgver() {
  cd libudfread
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd libudfread
  ./bootstrap
}

build() {
  cd build
  ../libudfread/configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
