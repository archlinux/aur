# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=1.1.1
pkgrel=1
pkgdesc="Rapid fuzzy string matching in C++ using the Levenshtein Distance"
arch=(any)
url="https://github.com/maxbachmann/rapidfuzz-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d46f6a2e64bd68589537353eea62e84e90af3307f213a4578448d026b96c6c3')

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
