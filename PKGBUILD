# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('1248a038bb6b045dfdede86a94bf3ef1db117dea2536fb5275615862616d488e4a33de7fb8c7dcf2cdcd6f8f5f34d4bee847450b19650d80881a12b052e243c6')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 "target/release/dofi" "$pkgdir/usr/bin/dofi"
  install -Dm644 "share/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/dofi.fish"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
