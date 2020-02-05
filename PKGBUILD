# Maintainer: Simon Vikstrom <simon@devsn.se>

pkgname=gr-soapy-git
pkgver=r168.42f68ca
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
