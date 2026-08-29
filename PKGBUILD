# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=cargo-shear
pkgver="1.13.4"
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a0061c9b2da12a924cc598b986cc2db4ed4291a22313f707e6d6e383b95f1b56d4146ce765a829c0d8491613466bba1f4624095f9d1a0cf6a0bd25f4927bd29a')

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
