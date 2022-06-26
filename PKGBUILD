# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=jarowinkler-cpp
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast Jaro and Jaro Winkler distance"
arch=(any)
url="https://github.com/maxbachmann/jarowinkler-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('27970eade7a351d0e61a5750b6d5fbb4aa09cd12f1bc6b1a8425559d430dff1c')

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
