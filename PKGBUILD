# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=get-blessed
_pkgname=get_blessed_rs
pkgver=0.2.0
pkgrel=1
pkgdesc="Get the best crates for your Rust projects with a few keybindings"
arch=('x86_64')
url="https://github.com/josueBarretogit/get_blessed_rs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c46fe44f2c4ce5e6712f8b09ce264197a9150285a0cdb3da52da7e6e057be78800681da413bc49749fa2214c711f5bdc65dedfad54810594b0e8bd3b8dc9fd0d')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
