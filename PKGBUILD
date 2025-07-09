# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=winchecksec
pkgver=3.1.0
pkgrel=4
pkgdesc="Checksec, but for Windows: static detection of security mitigations in executables"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/winchecksec/"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl' 'pe-parse')
makedepends=('cmake' 'uthenticode')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trailofbits/winchecksec/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d110f9d2c762ad5376991d3eb93a696f794787629dc41f8232ec00a087864d22')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "_build/winchecksec" -t "$pkgdir/usr/bin"
}
