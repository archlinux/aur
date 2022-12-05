# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.1.5
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal-bin')
depends=('skim')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f721f8683d2d457a7f60088acf01edd4f2c68381b111dc9d104555f95b0ce56d')

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
