# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termusic
pkgver=0.6.6
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
sha512sums=('1fc1c6cfab6852a948078982d186eddf6c31dbd290fc213118db181689b28a32051eac3bf29c037a691cbb75afcad4239c11e5268c65a855004eca78989524c9')
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
