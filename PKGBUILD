# Maintainer: Piggy NL <piggynl@outlook.com>
pkgname=lalrpop
pkgver=0.19.7
pkgrel=1
pkgdesc="LR(1) parser generator for Rust"
arch=(x86_64)
url="https://github.com/lalrpop/lalrpop"
license=(Apache MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d75bb1006e5c471f6f16f34fea3e986c91d2a22133238e68c9e0caf28f02b88a')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --frozen --bin $pkgname
}

check() {
  cd $pkgname-$pkgver

  # test requires debug version of lalrpop, so build again without --release
  cargo build --frozen --bin $pkgname
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
