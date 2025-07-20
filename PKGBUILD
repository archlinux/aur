# Maintainer: Rémi BERTHO <remi.bertho at dalan dot fr>

pkgname=save_my_code
pkgver=2.0.0
pkgrel=1
pkgdesc="smc - Utility to save code and other files"
arch=('x86_64')
url="https://codeberg.org/dalan/smc"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=(!lto)
source=("https://binaries.dalan.fr/smc/smc-v$pkgver-src.tar.zst")
sha512sums=('5687234733608c3fd3fb5082534f63478016dfe100c717fa8d0480db5883e3a59e2e7c5f954e5dafeadd5e29ac0b69f20bb5682f01355c1dcf9ff946197ae6ea')

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

