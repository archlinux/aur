# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=kdlfmt
pkgver=0.1.7
pkgrel=1
pkgdesc="A formatter for kdl documents."
arch=('x86_64')
url="https://github.com/hougesen/kdlfmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hougesen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('08446ab6edb00635ce2d0d2830b8d698c632f19dcbebfd2609c42d944e271c415b2fdceec197f52d537b4a7a111b3343dff02874e228466994a57d8b957657aa')
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

