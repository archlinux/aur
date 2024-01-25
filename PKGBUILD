# Maintainer: Luca Carlon <carlon.luca@gmail.com>

pkgname=cgrc
pkgver=2.0.4
pkgrel=1
pkgdesc='Generic log formatter'
arch=(any)
url='https://github.com/carlonluca/cgrc'
license=(GPL)
makedepends=(git cargo)
source=(git+https://github.com/carlonluca/cgrc.git#tag=v$pkgver)
md5sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  git submodule update --init
  cd "$srcdir/$pkgname/cgrc-rust"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$pkgname/cgrc-rust"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$pkgname/cgrc-rust"
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname/cgrc-rust"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
