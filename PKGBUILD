# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=cppitertools
pkgver=2.2
pkgrel=2
pkgdesc="Python itertools and builtin iteration functions for C++17"
arch=(any)
url="https://github.com/ryanhaining/cppitertools"
license=(BSD-2-Clause)
depends=()
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d4e796c9d8ec769fbd68df92943d238d0c43667307995ede058069e770827481')

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 $pkgname-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
