# Maintainer: Tobias Killer <tokidev at posteo dot de>
pkgname=ddpolymerase
pkgver=0.1.1
pkgrel=1
pkgdesc="Copy, repair and verify a file"
arch=('x86_64')
url="https://codeberg.org/tokideveloper/ddpolymerase"
license=('GPL3')
depends=('coreutils' 'util-linux')
makedepends=('cargo')
source=("$pkgname-v$pkgver.tar.gz::https://codeberg.org/tokideveloper/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('401ce5f4d4e488ef350b4185ca19d2d4d0c1be21d3db5f07838b06099ee33a17684206fb897756ee0fba081ee6abf162864aa516748b2c31693d74972eb5b1ca')

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --release --frozen
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/ddpolymerase" "$pkgdir/usr/bin/ddpolymerase"

  install -Dm644 "man/ddpolymerase.1" "$pkgdir/usr/share/man/man1/ddpolymerase.1"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS.md" "$pkgdir/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
}
