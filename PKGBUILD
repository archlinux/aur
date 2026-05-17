# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=cargo-shear
pkgver=1.12.4
pkgrel=1
pkgdesc="Remove unused dependencies in a Rust project"
arch=('x86_64')
url="https://github.com/Boshen/cargo-shear"
license=('MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('579d121fa9aa35c6e01f7a56eb6be9f89b6936d8764b202fe6f26173a581cb8bf6b0d03edda5673477e739e89076fde6e3dacde6c15abb3eeab761d6a35cc0c5')

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
