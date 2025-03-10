# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=icecream-cpp
pkgver=1.0.0
pkgrel=1
pkgdesc="Single header library for print debugging in C++11 and forward"
arch=('x86_64')
url="https://github.com/renatogarcia/icecream-cpp"
license=('MIT')
checkdepends=('cmake>=3.16' 'boost>=1.71.0')
provides=('icecream-debugging')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35fdbd012a4f7990c404c59b8291e04dc6103232323371ea7a2b18613b1b7900')

check() {
  export CPP_STANDARD=11
  cmake \
    -Wno-dev \
    -B build \
    -S "$pkgname-$pkgver"
  make -C build
  make -C build test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 644 icecream.hpp -t "$pkgdir/usr/include/"
  install -Dvm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
