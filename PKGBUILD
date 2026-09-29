# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=cargo-shear
pkgver="1.14.0"
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fb9a17c87d4398eba83ec0a3ae73476e302cd9c0083e037cc31ffc44409faf2bb98bb221d899704f2a9f114fb30ae98a6e9b036ce43b7fe8b445c176a2804643')

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
