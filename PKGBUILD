# Maintainer: Simon Vikstrom <simon@devsn.se>

pkgname=gr-soapy-git
pkgver=r26.946f950
pkgrel=1
pkgdesc="gr-soapy from librespacefoundation"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/librespacefoundation/gr-soapy.git"
license=('GPL3')
depends=('gnuradio' 'boost')
makedepends=('git' 'cmake' 'swig')
provides=('gr-soapy')
conflicts=('gr-soapy')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd gr-soapy

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  sed -i 's/env python$/env python2/g' gr-soapy/python/*

  mkdir -p gr-soapy/build
  cd gr-soapy/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd gr-soapy/build

  make DESTDIR="$pkgdir" install
}
