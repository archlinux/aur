# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.13.3
pkgrel=1
pkgdesc="A simple automated solution for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("GPL3")
depends=("mkvtoolnix-cli")
makedepends=("git" "rustup")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ffdeeb30c521e27739af01e1e0f57bc23d80ffd86754111688b0e17719647b49")

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
