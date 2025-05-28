# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=kdlfmt
pkgver=0.1.0
pkgrel=1
pkgdesc="A formatter for kdl documents."
arch=('x86_64')
url="https://github.com/hougesen/kdlfmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hougesen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e0dfc4db8c6605ebc16c6b693015f869ec7f391b89fd65eb18e49e9f6dccbcfdc22f672b0267f3965ba2d2e15cbad6e3a31e487421b03c5bd39e11056a2422db')
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

