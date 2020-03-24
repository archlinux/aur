# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Aidan Harris <mail@aidanharris.io>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=apg
pkgver=2.2.3
pkgrel=4
pkgdesc="Automated Password Generator."
arch=(x86_64)
url="http://www.adel.nursat.kz/apg/index.shtml"
license=('custom')
depends=('glibc')
source=(https://web.archive.org/web/20070609184004if_/http://www.adel.nursat.kz/apg/download/$pkgname-$pkgver.tar.gz)
md5sums=('3b3fc4f11e90635519fe627c1137c9ac')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's:^#\(CS_LIBS = -lnsl\)$:\1:' Makefile
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  for i in apg apgbfm; do
    install -D -m755 $i "$pkgdir"/usr/bin/$i
    install -D -m644 doc/man/$i.1 "$pkgdir"/usr/share/man/man1/$i.1
  done
  install -D -m 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
