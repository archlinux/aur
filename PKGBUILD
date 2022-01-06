# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=strace-analyzer
pkgver=0.5.0
pkgrel=1
pkgdesc="analyzes strace output"
arch=('x86_64' 'i686')
url="https://github.com/wookietreiber/strace-analyzer"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wookietreiber/strace-analyzer/archive/v$pkgver.tar.gz")
md5sums=('67d84ca0b2deab820f27c0f692723176')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  cargo build --release
}

check() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  cargo test
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  install -Dm755 "target/release/strace-analyzer" "$pkgdir/usr/bin/strace-analyzer"
}
