# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.16.1
pkgrel=1
pkgdesc="A CLI utility for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
depends=("ffmpeg")
makedepends=("clang" "pkgconf" "rust")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ddeb36b0ad7f53e6a70ceb63d97f810ddca12260c085b69709ede8472f37e048")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
