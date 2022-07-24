# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=1.0.5
pkgrel=1
pkgdesc="Rapid fuzzy string matching in C++ using the Levenshtein Distance"
arch=(any)
url="https://github.com/maxbachmann/rapidfuzz-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('64eb3534e7f0c785b53ca1f784b95bc0638c9c2b9cb074e4b01840c866404b4d')

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
