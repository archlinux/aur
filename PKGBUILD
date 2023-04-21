# Contributor: Dennis Hamester <dennis.hamester@startmail.com>

pkgname=scrawpp
pkgver=0.2.1
pkgrel=2
pkgdesc="Steam Controller C++ library"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
depends=(
  'scraw'
)
makedepends=(
  'cmake'
)
source=(
  "scrawpp-v$pkgver.tar.gz::$url/-/archive/v$pkgver/scrawpp-v$pkgver.tar.gz"
)
sha256sums=(
  '5a692508b6ee6e321fa2ae5aa7f99bee38900caf2f634e9e212e342038ab155d'
)

build() {
  cmake \
    -B build \
    -S "$pkgname-v$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-v$pkgver/LICENSE"
}
