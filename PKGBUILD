# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=1.0.4
pkgrel=1
pkgdesc="Rapid fuzzy string matching in C++ using the Levenshtein Distance"
arch=(any)
url="https://github.com/maxbachmann/rapidfuzz-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('14bcafba864e78662dd5f84e38412ebf589f12f45d3dd80fb5f5247b4f0f9b00')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
