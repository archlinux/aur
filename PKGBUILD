# Maintainer: Berin Aniesh <berinaniesh@gmail.com>
# Contributor: Berin Aniesh <berinaniesh@gmail.com>

pkgname=ucf
pkgver=0.1.5
pkgrel=1
pkgdesc='A code formatter that formats any code'
arch=('x86_64')
url=https://github.com/berinaniesh/ucf
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=("${pkgname}")
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/berinaniesh/ucf/main/LICENSE"
)
b2sums=('1219e67f800e3a92f0e6f38e687ae6d7ed7793e56e1bd635c2f460aba3ececfc98f76514597e1a7e4f337f7fed1dcb952581866ce63c9206da5c4d23dc44ba14'
        'f214d2545f6b759e0320ef3d96da22d6b0a50dda95d68d293bc2e74d274018c971bccc0a5393c5a6d876556c6f45cfeab90331aa7e3d66b1cd6dc6f803d3016b')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/${pkgname}
  install -Dm644  ../$pkgname-$pkgver-LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
