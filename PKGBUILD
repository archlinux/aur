# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=jarowinkler-cpp
pkgver=1.0.1
pkgrel=2
pkgdesc="Fast Jaro and Jaro Winkler distance"
arch=(any)
url="https://github.com/maxbachmann/jarowinkler-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver-2.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3a309f8446a9afec4f248a823f610bab047d3ada45ebf37009284fd2d80e0e9')

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
