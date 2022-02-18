# Maintainer: Vincent B <vb@luminar.eu.org>
pkgname=pqrs
pkgver=0.2.0
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
sha256sums=('eb6de6afd34aed8d0504d2176bbf6d5f428decc9409473b72720b426e0f8fe1b')
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
