# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.7
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
depends=('openssl')
url="https://github.com/jewlexx/ignoreit"

source=("$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/ignoreit/archive/v$pkgver.tar.gz")
sha256sums=('37b00b992ddd842a8dc94e1e52c59983544dadc201447df13e03170bb31cd567')

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
