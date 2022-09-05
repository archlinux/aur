# Mnaintainer: Kasei Wang <kasei@kasei.im>

pkgname=powercap
pkgver=0.6.0
pkgrel=1
pkgdesc='C bindings to the Linux Power Capping Framework in sysfs'
arch=('x86_64')
url='https://github.com/powercap/powercap'
license=('custom:BSD')
makedepends=('cmake')
source=("https://github.com/powercap/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4acd5ac85f297592b7006ed867ae5c73b3c5d7a3d6e773899609616fb9dd9b6c')
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
