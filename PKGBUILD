# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=osmo-fl2k
pkgver=0.1.1
pkgrel=1
pkgdesc="Library to use cheap (FL2000 based) USB3.0 to VGA converters as SDR"
arch=('any')
url="https://osmocom.org/projects/osmo-fl2k/wiki"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FFY00/osmo-fl2k/archive/v$pkgver.tar.gz")
sha256sums=('0124da419714350d98f9075f016c31ac5643b1b2956be35520acba85dc2ed7a4')

build() {
  mkdir -p "$srcdir"/$pkgname-$pkgver/build
  cd "$srcdir"/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
