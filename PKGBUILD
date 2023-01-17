# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.3.2
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
b2sums=('2cd31eabca813967ee11635d5ad492c027f708ee745e09f07507d6293c4353ec90302a78128fd988fb2f5b5957958832a920a381d682402e2fc5edd8e594e0d2')

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
