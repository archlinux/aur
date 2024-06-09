# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tui-slides
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal presentation utility with a modern TUI"
arch=('x86_64')
url="https://github.com/Chleba/tui-slides"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e2cfef62e5e10b3191c0669d4402db183b5e31dae9a6d587600cb30816ef319b2c63ea3cc7d7edcfc2b653311810d55f1dccc0efb20a047e9f2fb97f3d826f3c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
