# Please report issues with the package on GitHub or in the comments
# Maintainer: Lunush

pkgname=rates
pkgver=0.7.0
pkgrel=1
pkgdesc="Currency exchange rates in your terminal"
arch=("x86_64")
url="https://github.com/lunush/rates"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=("rates")
conflicts=("rates" "rates-bin" "rates-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('87eaaff12221fd285aa5d42359579ce64b0adf10b1b3539d422d5707340484fb')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/rates" "$pkgdir/usr/bin/rates"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
