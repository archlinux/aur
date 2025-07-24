# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media
pkgver=0.13.6
pkgrel=1
pkgdesc="A simple automated solution for muxing media (e.g. video, audio, subtitles)."
arch=("x86_64")
url="https://github.com/nujievik/mux-media"
license=("GPL3")
depends=("mkvtoolnix-cli")
makedepends=("git" "rustup")
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("1d2d8ed1b353aee0e277cbda8f01c1963978503b987492667b882f3cd8814b33")

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
