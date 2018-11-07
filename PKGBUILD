# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli+aur@gmail.com>

pkgname=jitterentropy
_pkgname=$pkgname-library
pkgver=2.1.2
pkgrel=1
pkgdesc='Hardware RNG based on CPU timing jitter'
arch=('x86_64')
url='http://www.chronox.de/jent.html'
license=('BSD')
source=(http://www.chronox.de/jent/$_pkgname-$pkgver.tar.xz{,.asc})
md5sums=('080f1b2464a03bc13108be4ba965f3c8'
         'SKIP')
validpgpkeys=(3BCC43D4D2C87D1784B69EE4421EE936326AC15B)

prepare() {
  cd "$_pkgname-$pkgver"

  # Disable man page compression on install
  sed -e '/\tgzip.*man/ d' -i Makefile
  # Let the package manager handle stripping
  sed -e '/\tinstall.*-s / s/-s //g' -i Makefile
}

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/include"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
