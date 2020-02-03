# Maintainer: Martin Mariano <arch@martinmariano.com>
pkgname=grex
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line tool for generating regular expressions from user-provided input strings."
arch=('x86_64')
url="https://github.com/pemistahl/grex"
license=('Apache-2.0')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ee936fa60cc95847107c71e84348df582ea13848985151f2bab47a9b14a223cb3eb24fe5e043788922de55f15975a552c2cdbdbda322d897dfd086147db5315a')

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
