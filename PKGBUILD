# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=magicrescue
pkgver=1.1.9
pkgrel=1
pkgdesc="Find and recover deleted files on block devices"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/magicrescue/"
license=('GPL')
source=(http://deb.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz)
sha256sums=('a920b174efd664afe9760a43700588c9c5e6182cb13d7421e07ab613bceeb3c7')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make PREFIX="${pkgdir}"/usr
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|' Makefile
  install -d "${pkgdir}"/usr
  make PREFIX="${pkgdir}"/usr install
}
