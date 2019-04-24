# Maintainer: Alexander Couzens <lynxis@fe80.eu>
pkgname=libxtrxdsp-git
_gitname=libxtrxdsp
pkgver=r10.614f52694ac0
pkgrel=2
pkgdesc="DSP specific function for SDR in general and XTRX in specific"
arch=('any')
url="https://github.com/xtrx-sdr/libxtrxdsp"
license=('LGPL')
makedepends=('git' 'cmake')
source=("git+$url")
md5sums=('SKIP')
provides=('libxtrxdsp')
conflicts=('libxtrxdsp')

pkgver() {
  cd "$srcdir"/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build

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
