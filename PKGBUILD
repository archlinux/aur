# Maintainer: Martin Mariano <arch@martinmariano.com>
pkgname=grex
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool for generating regular expressions from user-provided input strings."
arch=('x86_64')
url="https://github.com/pemistahl/grex"
license=('Apache-2.0')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pemistahl/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4fa6d4c908377e00f2d23015d78c4094e6a71df606665d53a95c4998e96d59413c7a392475abab2dc047aa93b12d78390528ab94afb7c9b0553ac1e370e0c1f9')

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
