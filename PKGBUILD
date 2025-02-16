# Maintainer: sineptic <sineptic0@gmail.com>
pkgsubn=clinote-git
pkgname=clinote-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI that saves notes separateded by categories, fast and easy"
arch=('any')
url="https://github.com/augustobeilfuss2/clinote"
license=('LGPL-3.0-only')
source=("$url/blob/main/clinote-git-$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  tar -xvzf $pkgname-$pkgver.tar.gz
  cd "clinote-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "clinote-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

package() {
  cd "clinote-$pkgver"
  install -Dm 755 "target/release/clinote" "$pkgdir/usr/bin/clinote"

}