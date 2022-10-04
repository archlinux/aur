# Maintainer: Vincent B <vb@luminar.eu.org>
pkgname=dbz
pkgver=0.1.5
pkgrel=1
epoch=
pkgdesc="A library (dbz-lib) and CLI tool (dbz-cli) for working with Databento Binary Encoding (DBZ) files"
arch=('i686' 'x86_64')
url="https://github.com/databento/dbz"
license=('Apache')
groups=()
depends=()
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/databento/dbz/archive/refs/tags/v0.1.5.tar.gz")
sha256sums=('b5efcbc0b5c459ec1787a8b9d233426982d0b77d1ca1b3af34798d7f4da26cc8')
noextract=()

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

# vim:set ts=2 sw=2 et:
