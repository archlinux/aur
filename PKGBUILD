# Maintainer: Martin Mariano <arch@martinmariano.com>
pkgname=grex
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool for generating regular expressions from user-provided input strings."
arch=('x86_64')
url="https://github.com/pemistahl/grex"
license=('Apache-2.0')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6a213d115ff246af9e3859277e020624e308ef8504e91d0e6748c7d545bb06226b00a4eb6fe88745fac0e2f5497e3d13e0f12aae7a9d083a9bf1827ca97aa30b')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/grex" "$pkgdir/usr/bin/grex"

  install -Dm644 "RELEASE_NOTES.md" "$pkgdir/usr/share/doc/${pkgname}/RELEASE_NOTES.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
