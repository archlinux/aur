# Mnaintainer: Kasei Wang <kasei@kasei.im>

pkgname=powercap
pkgver=0.4.0
pkgrel=1
pkgdesc='C bindings to the Linux Power Capping Framework in sysfs'
arch=('x86_64')
url='https://github.com/powercap/powercap'
license=('custom:BSD')
makedepends=('cmake')
source=("https://github.com/powercap/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c55ffc19a18747666b86848b5ccd980c82509ad2d1d254c49366301b0ec07d4')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build && cd ./build
  cmake .. -DBUILD_SHARED_LIBS=On \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cd build
  make DESTDIR=$pkgdir install
}
