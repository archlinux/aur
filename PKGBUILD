# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=conserve
pkgver=0.6.9
pkgrel=1
pkgdesc="Robust portable backup tool written in Rust"
arch=('x86_64')
url="https://github.com/sourcefrog/conserve"
license=('GPL2')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('97e1cbbcf15a40dbea166166b68c02b157a2e2a2bc344044e8d1f4f2759de6720664c4bcc8a61fe430bfd7b227a4a6e3aef52daf2ded6469fbe0ef3f1e8f2117')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
