# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=dont-hang
pkgver=1.0
pkgrel=1
pkgdesc="Simple GTK+ hangman game"
arch=('i686' 'x86_64')
url="https://pelzflorian.de/git/dont-hang/"
license=('custom:PublicDomain')
depends=('gtk3')
optdepends=('words: default word list')
source=("https://pelzflorian.de/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1e297cfe6f638e2d19664c4b02ee6c5fdbe26d39755a2297ef4c2ebbe9f28e76727d34d7d31a4e67790b0cb9878143a9ab79c1141215d0359bd548a6fc7775d1')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "COPYING" "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
