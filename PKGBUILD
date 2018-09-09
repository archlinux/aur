# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=strace-analyzer
pkgver=0.3.1
pkgrel=1
pkgdesc="analyzes strace output"
arch=('x86_64' 'i686')
url="https://github.com/wookietreiber/strace-analyzer"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wookietreiber/strace-analyzer/archive/v$pkgver.tar.gz")
md5sums=('de73539c159499e2312945d06a9d0478')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  cargo build --release
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  install -Dm755 "target/release/strace-analyzer" "$pkgdir/usr/bin/strace-analyzer"
}
