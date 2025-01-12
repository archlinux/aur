# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.6.3
pkgrel=1
pkgdesc='Portable and simple API for accessing Allen-Bradley and Modbus PLC data over Ethernet.'
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=(
  "$url/archive/v$pkgver.tar.gz"
  missing-string-header.patch
  )

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../missing-string-header.patch
}

build() {
  cd "$pkgname-$pkgver"
  mkdir build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ".."

  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
sha256sums=('ebbcd659d5137d1299780e49b139d1e991b5a731df6dca0d7130b58555673a6d'
            '198d18d5f97dbfcb3672465d30a0783e9fc9045233cc9be7a1d677346bde513b')
