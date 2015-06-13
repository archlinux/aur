# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree2
pkgver=2.2.2
pkgrel=1
pkgdesc="A program that generates images from written instructions called a grammar. Legacy v2."
arch=('i686' 'x86_64')
url="http://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
source=("http://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
md5sums=('df05c3ea98201bbc75d30b317197ef2b')

build() {
  cd "$srcdir/ContextFreeSource$pkgver.tgz"
  sed -i "s|size_t yyget_leng|int yyget_leng|" src-common/yglue.h
  sed -i "s|-lz|-lz -lm|" Makefile
  make
}

package() {
  cd "$srcdir/ContextFreeSource$pkgver.tgz"
  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg2"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}
