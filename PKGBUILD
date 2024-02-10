# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=crates-tui
pkgver=0.1.5
pkgrel=1
pkgdesc="A TUI for exploring crates.io"
arch=('x86_64')
url="https://github.com/ratatui-org/crates-tui"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f022783a1e571234f5cb9422952e900ff8c100210ba24929fabd85e40b4e1fa44d57450bdc130fcdb09ad71a2997ebc35102427dd82273433c8dfa09753a2763')
options=('!lto')

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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
