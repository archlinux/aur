# Maintainer: Alexander Thaller <aur+histdb-rs@alexander.thaller.ws>
pkgname=histdb-rs
pkgver=2.0.0
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/histdb-rs"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderThaller/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f7153eba42c0e2e91e885e810953d60357cf205fdde808711968e05257e9c5b25ad9a3bec440e1ed460fdb0fdb3b28adbe3dbaa56610f3aa29ad2195ffdfb3a3')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

 check() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
 }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
