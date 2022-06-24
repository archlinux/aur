# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=1.0.3
pkgrel=1
pkgdesc="Rapid fuzzy string matching in C++ using the Levenshtein Distance"
arch=(any)
url="https://github.com/maxbachmann/rapidfuzz-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7d29076a6fc519834bbedb7a95a2e7b5d40361b983b040afc32b5d98e4a94226')

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
