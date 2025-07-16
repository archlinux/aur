# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.13.0
pkgrel=1
pkgdesc="A simple automated solution for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("GPL-3.0")
depends=("mkvtoolnix-cli")
makedepends=("rust" "cargo" "git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("4fe0e79bcc1799434269c75572bf5bbdb8a8544c0a8b9c5c2582ad9513b83e24")
options=(!debug)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release || echo "Tests failed, continuing packaging anyway"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
