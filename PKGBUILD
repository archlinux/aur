# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.1.0
pkgrel=1
pkgdesc="A trash collector."
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
depends=('skim')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('11457b8373da8b04f33d12ce2431e44c7af980c6364abd834f24a249548414d1')

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
  install -Dm 644 "complete/cnc.bash" -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm 644 "complete/cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
