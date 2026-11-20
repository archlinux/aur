# Maintainer: ccatdev <ccatdev@proton.me>

pkgname=concord
pkgver=2.7.1
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc libstdc++ alsa-lib libpipewire libva)
optdepends=('mpv: video playback support')
makedepends=(cargo clang cmake nasm git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de1624f460b1fb4148256d7b9141bb1ed6b9cf9b9e3b05fd166798370f35e031')
options=('!lto')

prepare() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  install -vDm 755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
