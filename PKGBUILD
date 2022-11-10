# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.1.3
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal-bin')
depends=('skim')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fa39ca16099e0b9ca4548f737e18b31ba2ba2ea1a949b01b0c8793b6f6bab0af')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/cnc" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/cnc.bash" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "completions/cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/cnc.nu" -t "$pkgdir/usr/share/nushell/completions"
}
