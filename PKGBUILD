# Maintainer: Akatsuki Rui <akiirui@outlook.com>

pkgname="mpv-handler"
pkgver=0.2.14
pkgrel=1
pkgdesc="Play website videos and songs with mpv & youtube-dl."
arch=("x86_64")
depends=("mpv" "youtube-dl")
makedepends=("cargo" "git")
url="https://github.com/akiirui/mpv-handler/"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/mpv-handler/archive/v$pkgver.tar.gz")
b2sums=('5e77515df1b02d730dac56b4a8d7609fb946af1620ffbd80c6a17faf401ec77fbe8e04bfbac964450776282cf31b651eddf6602badb9dbca8a6bcdb4a9b3d97e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  RUSTUP_TOOLCHAIN=stable cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/mpv-handler" "$pkgdir/usr/bin/mpv-handler"
  install -Dm644 "share/config.toml" "$pkgdir/etc/mpv-handler/config.toml"
  install -Dm644 "share/linux/mpv-handler.desktop" "$pkgdir/usr/share/applications/mpv-handler.desktop"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
