# Maintainer: Sebastien MacDougall-Landry

pkgname=gobble
pkgver=1.3
pkgrel=2
pkgdesc='Window swallowing on any WM'
url='https://github.com/EmperorPenguin18/gobble/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmperorPenguin18/gobble/archive/refs/tags/$pkgver.tar.gz")
arch=('x86_64')
license=('GPL3')
makedepends=('cargo' 'pandoc')
depends=('libxcb')
sha256sums=('613ad939bef746d9a196ed3587011aabb372abe11c3ac0813dd440cdd3c7f4bf')

prepare () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch
}

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --target-dir target --offline
  pandoc gobble.1.md -s -t man -o gobble.1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/gobble -t "$pkgdir/usr/bin"
  install -Dm644 gobble.1 "$pkgdir/usr/share/man/man1/gobble.1"
}
