# Maintainer: GGORG <me at ggorg dot xyz>
# Contributor: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=extest
pkgver=1.0.3
pkgrel=1
pkgdesc='X11 XTEST reimplementation primarily for Steam Controller on Wayland (for 64-bit Steam client)'
url='https://github.com/Supreeeme/extest'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Supreeeme/extest/archive/refs/tags/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/Supreeeme/extest/$pkgver/LICENSE")
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
sha256sums=('3b4c63dd0dae72a459b780ce5479eaaa81862cbb902683f62b8c7f1a82ddac73' 'SKIP')

dirname=extest-$pkgver

prepare() {
  cd "$srcdir/$dirname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "x86_64-unknown-linux-gnu" # force 64-bit build
}

build () {
  cd "$srcdir/$dirname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features  --target "x86_64-unknown-linux-gnu" # force 64-bit build
}

package() {
  cd "$srcdir/$dirname"
  install -Dm755 target/x86_64-unknown-linux-gnu/release/libextest.so "${pkgdir}/usr/lib/libextest.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
