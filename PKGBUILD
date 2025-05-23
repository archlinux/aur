# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=brush
pkgver=0.2.18
pkgrel=1
pkgdesc="Bash/POSIX-compatible shell implemented in Rust"
arch=('x86_64')
url="https://github.com/reubeno/brush"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-shell-v$pkgver.tar.gz")
sha256sums=('4fd119fcbede5ff89ac8d4c55deac21a7a31278ff6649576b2fb40c04398918e')

prepare() {
  mv "$pkgname-$pkgname-shell-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

# https://github.com/reubeno/brush/issues/429
# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
