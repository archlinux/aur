# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.6
pkgrel=2
makedepends=('rust' 'cargo')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
depends=('openssl')

source=("$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/ignoreit/archive/v$pkgver.tar.gz")

sha256sums=('da4b301e8874aad048b5eff2f507ee05dc1e60ef010b74de225c6ab2bceccf0f')

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
