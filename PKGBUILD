# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=lib32-extest
pkgver=1.0.2
pkgrel=1
pkgdesc='X11 XTEST reimplementation primarily for Steam Controller on Wayland '
url='https://github.com/Supreeeme/extest'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Supreeeme/extest/archive/refs/tags/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/Supreeeme/extest/1.0.2/LICENSE")
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'lib32-rust-libs')
sha256sums=('c8b7b79b761b3afa3d7e8dedbea3b8156864c4b4f122ff7297a47ef69b306933' 'SKIP')

dirname=extest-$pkgver

prepare() {
  cd "$srcdir/$dirname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "i686-unknown-linux-gnu" # the package requires this target
}

build () {
  cd "$srcdir/$dirname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$dirname"
  install -Dm755 target/i686-unknown-linux-gnu/release/libextest.so "${pkgdir}/usr/lib32/libextest.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
