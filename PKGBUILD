# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=oranda
pkgver=0.1.1
pkgrel=1
pkgdesc="generate beautiful landing pages for your projects"
url="https://github.com/axodotdev/oranda"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('efa485656a6325f6296a60b1514e00e2998ae630f30f4c069d0eaa3bcb241910dc60194b07fe252f835641be558ccb7a8db55886307fa271045d1e24644ea20a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
