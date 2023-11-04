# Maintainer: Rémi BERTHO <remi.bertho at dalan dot fr>

pkgname=save_my_code
pkgver=1.0.0
pkgrel=1
pkgdesc="smc - Utility to save code and other files"
arch=('x86_64')
url="https://codeberg.org/dalan/smc"
license=('MIT')
depends=('glibc' 'xz' 'gcc-libs' 'bzip2')
makedepends=('cargo')
source=("https://binaries.dalan.fr/smc/smc-$pkgver-src.tar.zst")
sha512sums=('ceb089e0d2b6fc93e52211a526339256045ee828bc85ec844c2551ef4c09d45466df852d94ee1980cb258032955d5945daf519524f4c94a613062d0d5a974854')

build() {
  cd "smc"
  RUSTFLAGS="-C target-cpu=native" cargo build --release --locked --target-dir=target
}

package() {
  cd "smc"
  install -Dm 755 "target/release/smc" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

