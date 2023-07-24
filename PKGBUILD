# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=oranda
pkgver=0.2.0
pkgrel=1
pkgdesc="generate beautiful landing pages for your projects"
url="https://github.com/axodotdev/oranda"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('07bcb3be11aed0831355222a83ce01e3686721e6f18113fda03250bb47087809a800ea5e10b42fc938050441625de40cf2832ecf5a6dae210b6c37df534b8294')

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
