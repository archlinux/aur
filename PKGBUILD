# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-supply-chain
pkgver=0.2.0
pkgrel=1
pkgdesc="Gather author, contributor and publisher data on crates in your dependency graph"
arch=('x86_64')
url="https://github.com/rust-secure-code/cargo-supply-chain"
license=('Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('2c86aae43203422095f195ebeae2f7d5c7fcf259a26b8366988cfc3b7fe827813178959b5f158c11babfef35c40dfaf6d9248054cc3f624639100d4b514b9504')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
