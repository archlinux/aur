# Maintainer: Alexander Milchinskiy <milchinskiy at gmail dot com>
pkgname=atomblocks
pkgver=0.1.1
pkgrel=1
pkgdesc="async, absolutely lightweight and dead simple bar for dwm and similar window managers"
arch=('any')
url="https://github.com/milchinskiy/atomblocks"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('809043c4ade7c4a78afe8a0de0801b7ad77913146ec8da190267fe095ed83d6b')

prepare() {
  cd "$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" sample/*
}
