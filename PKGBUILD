# Maintainer: Alexander Couzens <lynxis@fe80.eu>
pkgname=libxtrxll-git
_gitname=libxtrxll
pkgver=r33.50176aff00ae
pkgrel=1
pkgdesc="Low level XTRX hardware abstraction library"
arch=('any')
url="https://github.com/xtrx-sdr/libxtrxll"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('libusb3380')
provides=('libxtrxll')
conflicts=('libxtrxll')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir"/$_gitname/build
  cd "$srcdir"/$_gitname/build

  cmake .. \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_gitname/build

  make DESTDIR="$pkgdir" install
}

