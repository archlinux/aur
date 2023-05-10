# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.3.4
pkgrel=1
pkgdesc="Play website videos and songs with mpv & youtube-dl."
arch=("x86_64")
depends=("mpv")
optdepends=(
  "yt-dlp: ytdl-hook support"
  "youtube-dl: ytdl-hook support"
)
makedepends=("cargo" "git")
install="mpv-handler.install"
url="https://github.com/akiirui/mpv-handler/"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/mpv-handler/archive/v$pkgver.tar.gz")
b2sums=('a81a91ca0a74b5ca753f0b99f6e89bcfd6c607f167d3f3bdd734dad823b984dea1f6d2ec28e29a6fef446c8d6277caa817533caee3911b10f8639fb5e06eddab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN=stable cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/mpv-handler" "$pkgdir/usr/bin/mpv-handler"
  install -Dm644 "share/linux/config.toml" "$pkgdir/usr/share/doc/mpv-handler/config.toml"
  install -Dm644 "share/linux/mpv-handler.desktop" "$pkgdir/usr/share/applications/mpv-handler.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
