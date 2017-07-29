# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=dont-hang
pkgver=1.1
pkgrel=1
pkgdesc="Simple GTK+ hangman game"
arch=('i686' 'x86_64')
url="https://pelzflorian.de/dont-hang/"
license=('custom:PublicDomain')
depends=('gtk3')
optdepends=('words: default word list')
source=("https://pelzflorian.de/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('86f6e58ac02c112ec65ce6c8be5e2b777db5b9dc47b37421c47a30e5f210134d4eb91cd4337fb3edd1d471f2f8e56484e1dbfac6f7230247017c0491569f12d0')

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
