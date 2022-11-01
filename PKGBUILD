# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond-aligner
pkgver=2.0.15
pkgrel=1
pkgdesc="accelerated BLAST compatible local sequence aligner"
arch=('x86_64')
url="https://github.com/bbuchfink/diamond"
license=('AGPL3')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
sha256sums=('cc8e1f3fd357d286cf6585b21321bd25af69aae16ae1a8f605ea603c1886ffa4')

prepare() {
  # shellcheck disable=2154
  mkdir -p "$srcdir"/diamond-$pkgver/build
}

build() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install
}
