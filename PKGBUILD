# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gittype
pkgver=0.6.2
pkgrel=1
pkgdesc="Turn your source code into typing challenges"
arch=('x86_64')
url="https://github.com/unhappychoice/gittype"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bbfd039d609855bd13b893933800dc04459221e419ed1ba721155b7c7566b8a2')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

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
