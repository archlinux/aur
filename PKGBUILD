# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=clock-tui
pkgver=0.6.1
pkgrel=1
pkgdesc="A clock, timer, and stopwatch for your terminal"
arch=("x86_64")
url="https://github.com/race604/clock-tui"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('49958809acd0733e9ab4ed718b61892a3201dcf7ef15335ca2156481bb1eb39d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
  cargo run --release --locked --bin xtask
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/tclock" "$pkgdir/usr/bin/tclock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "assets/gen/_tclock" "$pkgdir/usr/share/zsh/site-functions/_tclock"
  install -Dm644 "assets/gen/tclock.bash" "$pkgdir/usr/share/bash-completion/completions/tclock"
  install -Dm644 "assets/gen/tclock.fish" "$pkgdir/usr/share/fish/vendor_completions.d/tclock.fish"

  install -Dm644 "assets/gen/tclock.1" "$pkgdir/usr/share/man/man1/tclock.1"
}

