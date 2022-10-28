# Maintainer: Erwann (AirOne01) LAGOUCHE <erwann.lagouche@gmail.com>
pkgname=hibe
pkgver=1.0.0
pkgrel=1
pkgdesc="Quick utility for hibernating your system"
arch=(any)
url="https://github.com/AirOne01/hibe"
license=('MIT')
groups=()
depends=(git)
makedepends=(cargo)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
md5sums=()
sha256sums=('SKIP')

prepare() {
  git clone "https://github.com/AirOne01/hibe" scode
  cp -r scode/src .
  cp scode/Cargo* .
  rm -rf scode
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
