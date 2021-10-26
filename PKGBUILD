# Maintainer: Sebastien MacDougall-Landry

pkgname=gobble
pkgver=1.2
pkgrel=1
pkgdesc='Window swallowing on any WM'
url='https://github.com/EmperorPenguin18/gobble/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmperorPenguin18/gobble/archive/refs/tags/$pkgver.tar.gz")
arch=('x86_64')
license=('GPL3')
makedepends=('cargo' 'pandoc' 'gzip')
depends=('libxcb')
sha256sums=('b9d971fe3a7aa8b0ca28d5023b87ba752bc92a1bbd61c60599c1d9c4831d8a8f')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --target-dir target
  pandoc gobble.1.md -s -t man -o gobble.1
  gzip -f gobble.1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/gobble -t "$pkgdir/usr/bin"
  install -Dm644 gobble.1.gz "$pkgdir/usr/share/man/man1/gobble.1.gz"
}
