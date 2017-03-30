# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wdt
pkgver=1.27.1612021
pkgrel=1
pkgdesc="Tool to transfer data between 2 systems as fast as possible over multiple TCP paths"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wdt"
license=('BSD')
makedepends=('cmake' 'glog' 'gflags')
checkdepends=('gtest')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b0ab593b2dae0c9fefb53cc1d2e0f54397be55023a694c6bcc70b6c4f73cea0a')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ../
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"

  ./run-test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
