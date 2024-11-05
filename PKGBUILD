# Maintainer: envolution
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=magicrescue
pkgver=1.1.10
pkgrel=1
pkgdesc="Find and recover deleted files on block devices"
arch=('i686' 'x86_64')
url="https://github.com/jbj/magicrescue"
license=('GPL-2.0-or-later')
source=(http://deb.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz)
sha256sums=('060c77be3e86a328a4f90f45d2da41b2b78cb74f13d44f69e29909cf68e98cad')

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
