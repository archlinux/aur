# Maintainer: Sebastien MacDougall-Landry

pkgname=scrycli
pkgver=0.2
pkgrel=1
pkgdesc='CLI tool for Scryfall'
url='https://github.com/EmperorPenguin18/scrycli/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmperorPenguin18/scrycli/archive/refs/tags/$pkgver.tar.gz")
arch=('x86_64')
license=('GPL3')
makedepends=('pandoc')
depends=('libscry>=0.3.1' 'chafa')
sha256sums=('aadfc3930676cbca8d2e3c4cc838b3e9c64a261dd30233854bac57cb61f08d5d')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  g++ -O3 src/*.cc -o scrycli
  pandoc scrycli.1.md -s -t man -o scrycli.1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 scrycli -t "$pkgdir/usr/bin"
  install -Dm644 scrycli.1 -t "$pkgdir/usr/share/man/man1"
}
