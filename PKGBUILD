# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.15.0
pkgrel=1
pkgdesc="A simple automated utility for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("GPL3")
depends=("mkvtoolnix-cli")
optdepends=(
  "ffmpeg: for retiming and custom output containers (.avi, .mp4, .webm)"
)
makedepends=("git" "rustup")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("2190c53c04fc185e9b17c7d501ee0012c9682fca8a51cd6087f1a8460b2f60ba")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ -n "$RUN_TESTS" ]]; then
    echo "Running tests because RUN_TESTS is set"
    cargo test --release
  else
    echo "Skipping tests (set RUN_TESTS=1 to enable)"
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
