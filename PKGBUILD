# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=get-blessed
_pkgname=get_blessed_rs
pkgver=0.2.1
pkgrel=1
pkgdesc="Get the best crates for your Rust projects with a few keybindings"
arch=('x86_64')
url="https://github.com/josueBarretogit/get_blessed_rs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d1be1882038a61475abf4c0c2c1b6360b7f40a0ad75bc0b568eb17c0fe00a9dab8402dc25ab101b6a85eef4cd0953c9c00a7077218fefed0bc0730f6d4a6c9c6')

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
