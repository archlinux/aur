# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.13.4
pkgrel=1
pkgdesc="A simple automated solution for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("GPL3")
depends=("mkvtoolnix-cli")
makedepends=("git" "rustup")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("a8a1687eec2673379b50eef74bc0edcc6daaef632ae1e21b4d4c15405e023f7b")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ -n "$RUN_TESTS" ]]; then
    echo "Running tests because RUN_TESTS is set"
    cargo test --release --locked
  else
    echo "Skipping tests (set RUN_TESTS=1 to enable)"
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
