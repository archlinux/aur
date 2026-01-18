# Maintainer: Mojahid <mojahid8238@gmail.com>
pkgname=rataplay
pkgver=1.1.0
pkgrel=1
pkgdesc="A high-performance Rust TUI for YouTube playback and management using yt-dlp and mpv"
arch=('x86_64' 'aarch64')
url="https://github.com/mojahid8238/Rataplay"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl' 'mpv' 'yt-dlp')
makedepends=('cargo' 'git')
provides=('rataplay')
conflicts=('rataplay-git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('26a996f00d1da3d2bcc18838b21c9ddf41527fe11e4262a501ad2abc462c08db')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rataplay" "$pkgdir/usr/bin/rataplay"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
