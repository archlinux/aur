# Maintainer: jD91mZM2 <me@krake.one>
pkgname=termplay
pkgver=2.0.5
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0d8e14301137c01e51294ab571507310d77cd1aa7c51fb47b85a637edc9110cce2466da7b5bfc43271d92560df65fe5bac8585be24021be98396056adf410fbb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --features bin
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
