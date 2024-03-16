# Maintainer: Rémi BERTHO <remi.bertho at dalan dot fr>

pkgname=save_my_code
pkgver=1.1.0
pkgrel=1
pkgdesc="smc - Utility to save code and other files"
arch=('x86_64')
url="https://codeberg.org/dalan/smc"
license=('MIT')
depends=('glibc' 'xz' 'gcc-libs' 'bzip2')
makedepends=('cargo')
options=(!lto)
source=("https://binaries.dalan.fr/smc/smc-v$pkgver-src.tar.zst")
sha512sums=('4ee15382e138db0627d9f114ea8a7bcb869221a3098bbd5d77df2bd6103eb3e96fae7d8eba680d71cd5ab448f8c8be1988e7f36d41970772cbb28c6e50cffd40')

build() {
  cd "smc-v$pkgver-src"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "smc-v$pkgver-src"
  install -Dm 755 "target/release/smc" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

