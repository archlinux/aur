# Maintainer: hexbyte16 <islamamara062@gmail.com>
pkgname=pomodoro-tui
pkgver=1.0.9
pkgrel=1
pkgdesc="Professional Pomodoro TUI with Discord and YouTube BGM support."
arch=('x86_64')
url="https://github.com/hexbyte16/rust-pomo-discord"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'libdbus' 'alsa-lib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hexbyte16/rust-pomo-discord/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc56d96980bbd43dd92c0c7c9da227216c3a275dc6b18dbce249cd674458b87d')

prepare() {
  cd "rust-pomo-discord-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "rust-pomo-discord-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "rust-pomo-discord-$pkgver"
  install -Dm755 "target/release/pomodoro-tui-discord" "$pkgdir/usr/bin/pomodoro-tui"
  ln -s /usr/bin/pomodoro-tui "$pkgdir/usr/bin/pomo"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
