pkgname=augenblick
pkgver=0.2.6
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 and Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc' 'libxcb')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("b9ceedeaf2e7e8b7ce5685ff6583253a89e1e1370a91d4cdd7d253ad48e38030")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/augenblick"
}
