# Maintainer: rfvgyhn

pkgname=proton-usage
pkgver=0.1.0
pkgrel=1
pkgdesc="Lists Steam applications that have specified a Steam Play compatibility tool"
arch=("x86_64")
url="https://github.com/rfvgyhn/proton-usage"
license=("MIT")
provides=("proton-usage")
conflicts=("proton-usage")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d7981c4fc2f4e2ec56adcd3aeb50616e1ee796435f178524567f3fa8a26730ac')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
