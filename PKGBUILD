# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=dbus-cxx
pkgver=0.11.0
pkgrel=2
pkgdesc="A C++ wrapper for DBus"
url="https://dbus-cxx.github.io/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
depends=('dbus' 'libsigc++' 'popt' 'glibmm')
makedepends=('cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0ac63bd6a7f4dcdfc7a1db9bcbdb491a8e84ced26d1b14847dd837c7cdf2c14d9101710b72b3e9bc247f0c1d31aac44e24e3f23f165efbd0c4e1799a4b0d0448')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_GLIBMM=ON
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}
