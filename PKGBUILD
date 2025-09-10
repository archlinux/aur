# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=kdlfmt
pkgver=0.1.4
pkgrel=1
pkgdesc="A formatter for kdl documents."
arch=('x86_64')
url="https://github.com/hougesen/kdlfmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hougesen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('776b0a61037e9add533f3feeb4815847e7ef34f82a9f06ed17a442509cbdf1e151c82f1b68e2fab5ab4f0467f310fee8963d3b01958f593f1a11acb0cbabea57')
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

