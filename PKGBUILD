# Maintainer: Tamir Zahavi-Brunner <tamir.z3@gmail.com>
pkgname=ragit
pkgver=0.3.5
pkgrel=1
pkgdesc="git-like rag pipeline"
arch=('x86_64')
url="https://github.com/baehyunsol/ragit"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/baehyunsol/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f69c1b85159f9ea01244a935db2cdbc322d412424a6100be55d9cd61f9147a25')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/rag" "$pkgdir/usr/bin/rag"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/docs/"
}
