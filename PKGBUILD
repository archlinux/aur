# Maintainer: Vee Satayamas <veerpub@pm.me>

pkgname=nevi
pkgver=0.2.0
pkgrel=1
arch=(x86_64)
url=https://github.com/anthonyamaro15/nevi
license=(MIT)
depends=(glibc)
makedepends=(cargo)
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz)
sha256sums=(9c51c1ce666f7bad7e522894d5f485faadf9f91087fe5179fcb8dd14272805b8)
options=('!lto')

package() {
  cd $pkgname-pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
