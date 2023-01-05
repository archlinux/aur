# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.10
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
depends=('openssl')
url="https://github.com/jewlexx/ignoreit"

source=("$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/ignoreit/archive/v$pkgver.tar.gz")
sha256sums=('dd91a8b36bd669dd997a7aee25df02bb317b4e43ac08637383fd7ef0e7203833')

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
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
