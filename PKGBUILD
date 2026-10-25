# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.6.3
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc libstdc++ alsa-lib libpipewire libva)
optdepends=('mpv: video playback support')
makedepends=(cargo clang cmake nasm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('473059af85ca8c7d2433ebd2a024951a8159c6109399fecaad238deaf2fd717a')
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
