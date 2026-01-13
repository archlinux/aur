# Maintainer: hexbyte16 <islamamara062@gmail.com>
pkgname=pomodoro-tui
pkgver=1.0.7
pkgrel=2
pkgdesc="Professional Pomodoro TUI with Discord and YouTube BGM support."
arch=('x86_64')
url="https://github.com/hexbyte16/rust-pomo-discord"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'libdbus' 'alsa-lib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hexbyte16/rust-pomo-discord/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('تأكد_من_الchecksum_الصحيح')

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
