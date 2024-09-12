# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tui-slides
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal presentation utility with a modern TUI"
arch=('x86_64')
url="https://github.com/Chleba/tui-slides"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c117bf56d9ce83c3aea537090d30ea6efa22e3f5a0779a08f421e66327e36b3ca6a2a69a8b52dd3002236c7f8af3751c3f0f095702a0f561fca103545d108ae4')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
