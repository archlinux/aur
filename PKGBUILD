# Maintainer: architekton <architekton350 at gmail.com>
# Contributor: jD91mZM2 <me@krake.one>

pkgname=termplay
pkgver=2.0.6
pkgrel=2
pkgdesc="Play an image/video in your terminal!"
arch=("x86_64")
url="https://github.com/jD91mZM2/termplay"
license=("MIT")
makedepends=("rust" "openal" "libsndfile" "gstreamer" "gst-plugins-base" "gst-plugins-bad")
optdepends=(
    "ffmpeg: Video support"
    "maim: Screen-mirroring support"
    "youtube-dl: YouTube support")
depends=("gstreamer" "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly" "gst-plugins-bad" "libsixel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jD91mZM2/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c81d1324a4b33148f011af6b6eb6379b0f9b6c53f6f646d16502f73138c3f4ab37d2f3ac1e9a7a8aaddd201f8dc4cd8f0d2d20d7f9c9e27c45a04e0490a25089')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --features bin
}

check() {
	cd "$pkgname-$pkgver"
  cargo test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
