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
sha256sums=('a2fef6f612950cdc0595c39b7688bfb10300a10dfd4738d4e94ba979531dcc61')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --target-dir target
  pandoc gobble.1.md -s -t man -o gobble.1
  gzip -f gobble.1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/gobble -t "$pkgdir/usr/bin"
  install -Dm644 $startdir/gobble.1.gz "$pkgdir/usr/share/man/man1/gobble.1.gz"
}
