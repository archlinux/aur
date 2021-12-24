# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termusic
pkgver=0.6.4
pkgrel=1
pkgdesc="Music Player TUI written in Rust"
arch=('x86_64')
url="https://github.com/tramhao/termusic"
license=('MIT' 'GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
optdepends=('ueberzug: display album covers'
            'youtube-dl: download mp3'
            'yt-dlp: download mp3'
            'ffmpeg: download mp3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b29a250329df241baf0a34d7b63ad615598df0c1d66abd22cc1781a5095ab99dbdeb899b9fc5d6e0f5c497cd19603ca63edea650291fad0cc4946b10dfe9942d')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --features yt-dlp
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --features yt-dlp
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE_MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
