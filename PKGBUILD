# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=cargo-shear
pkgver="1.13.2"
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ea3339d0cec34131fe4eb4ef81eb0fe069987fc44a7d9efae086380bf11501934fce06b1aa3477c6339cca57a6ba59552820955adde52b60f3efbb62883e0e28')

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
