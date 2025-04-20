# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=kdlfmt
pkgver=0.0.15
pkgrel=1
pkgdesc="A formatter for kdl documents."
arch=('x86_64')
url="https://github.com/hougesen/kdlfmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hougesen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8acc751295eeb92f4a036d6f3975ec401f81033c420c8d8276a7424f05c8918b029f39fc480395e00b05e6b7a3f557e9d2f8524f13a75272c03f7a6a2e899486')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo check
  cargo build --release --locked
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/kdlfmt" "$pkgdir/usr/bin/kdlfmt"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

