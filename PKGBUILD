# Maintainer: vinceTheProgrammer vincetheprogrammer@gmail.com

pkgname=fastbash
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script manager for fast Bash scripting."
arch=('x86_64')
url="https://github.com/vinceTheProgrammer/fastbash"
license=('MIT')
depends=()
options=(debug !strip)
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('264a758ae06eefd6b904688c2f88b79bb50a33e9991d5a413073b3b5b098d7ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/fastbash" "$pkgdir/usr/bin/fastbash"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install completions
  install -Dm644 completions/fastbash.bash \
    "$pkgdir/usr/share/bash-completion/completions/fastbash"
}
