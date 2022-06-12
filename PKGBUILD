# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=jarowinkler-cpp
pkgver=1.0.1
pkgrel=1
pkgdesc="Fast Jaro and Jaro Winkler distance"
arch=(any)
url="https://github.com/maxbachmann/jarowinkler-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8fe5f27db2d6c663de714da14c136b15f8b4005e538031e881393c5dd2dd1171')

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
