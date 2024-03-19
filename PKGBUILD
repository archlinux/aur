# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>

pkgname=toml11
pkgver=3.8.1
pkgrel=1
pkgdesc="C++11 header-only toml parser/encoder"
arch=(any)
url="https://github.com/ToruNiina/toml11"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a3d20080ecca5ea42102c078d3415bef80920f6c4ea2258e87572876af77849')

build() {
  cmake -B build -S "$pkgname-$pkgver" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=COMPILER \
    -Dtoml11_BUILD_TEST=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
