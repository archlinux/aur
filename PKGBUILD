# Maintainer: Alexander Couzens <lynxis@fe80.eu>
pkgname=libxtrx-git
pkgver=r53.9af1c458b567
pkgrel=1
pkgdesc="High level API for the xtrx SDR"
_gitname=libxtrx
arch=('any')
url="https://github.com/xtrx-sdr/libxtrx"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('liblms7002m-xtrx'
         'libxtrxdsp'
         'libxtrxll'
         'qcustomplot-qt5'
         'soapysdr')
source=("git+$url")
md5sums=('SKIP')
provides=('libxtrx')
conflicts=('libxtrx')

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
    -DCMAKE_BUILD_TYPE=Debug

  make
}

package() {
  cd "$srcdir"/$_gitname/build

  make DESTDIR="$pkgdir" install
}

