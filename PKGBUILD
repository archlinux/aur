# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dedoc
pkgver=0.2.1
pkgrel=1
pkgdesc='terminal based viewer for DevDocs'
arch=('x86_64')
url='https://github.com/toiletbril/dedoc'
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/toiletbril/dedoc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('dc172c9cc61ed5a7126b907eb1ace5bba2b5049249d93dceb5f6b3d3acb3f92bb5616cf14bcfd3e0d0f9b0bd39b71a1655da9310bd882057f92210fbf5097106')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/dedoc" "$pkgdir/usr/bin/dedoc"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
