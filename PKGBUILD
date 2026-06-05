# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=cargo-shear
pkgver="1.13.0"
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c9b7103f39a2b1dd6da03dd6604e326790c021d00b5022c6b3dadb8a6346954e1cf8efddab43ceaa7af34347ce3dc6069e84ace66a0fb86a542ad30db5e241d8')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked -- --skip expand_cfg_test_dev_dep_via_macro
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
