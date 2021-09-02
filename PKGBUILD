# Maintainer: Alexander Thaller <aur+histdb-rs@alexander.thaller.ws>
pkgname=histdb-rs
pkgver=2.0.1
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/histdb-rs"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderThaller/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7d9dbefb008a11a0907dff3d703cd848f92272d3a8ec4b4924b2ef077be2e60121f0535f15b9084c374255734810398f8c377a2b937ffa1ca2be73d7a53193fe')

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
