# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=flowy
pkgver=0.4.0
pkgrel=1
pkgdesc="A lean, privacy-preserving dynamic wallpaper changer written in Rust"
arch=('x86_64')
url="https://github.com/vineetred/flowy"
license=('GPL')
makedepends=('cargo')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a0c4b98140df25f4c0a6d129dd9f5394c930c304c93527b5a7c664d649b9d677')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
