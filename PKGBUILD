# Maintainer: Vincent B <vb@luminar.eu.org>
pkgname=pqrs
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Command line tool for inspecting Parquet files"
arch=('i686' 'x86_64')
url="https://github.com/manojkarthick/pqrs"
license=('MIT' 'Apache')
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
source=("https://github.com/manojkarthick/pqrs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df23a9e3c33b5f3f4f7cd66fc579c0a5ccc2b9d1d20c4f612f9a51c3a73024e7')
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
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
