# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termusic
pkgver=0.6.12
pkgrel=1
pkgdesc="Music Player TUI written in Rust"
arch=('x86_64')
url="https://github.com/tramhao/termusic"
license=('MIT' 'GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
optdepends=('ueberzug: display album covers'
            'yt-dlp: download mp3'
            'ffmpeg: download mp3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a371b1bf52a663ae30bddf6289ebad0d6d5c37996dae7790fdf4b21c0c1c72b6735508dc2a19e932ca551e2774b5279560acc73be2c269ecc38d2d02eb58d853')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE_MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
