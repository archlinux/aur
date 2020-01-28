# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=stor-age
pkgver=0.5.0
pkgrel=1
pkgdesc="show aging of directories"
arch=('x86_64' 'i686')
url="https://github.com/idiv-biodiversity/$pkgname"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/idiv-biodiversity/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ecf9f1d9eba32586cf4bf11c4c5675eb')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  cargo build --release
}

check() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  cargo test --release
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
