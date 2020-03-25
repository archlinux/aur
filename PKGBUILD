# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Aidan Harris <mail@aidanharris.io>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=apg
pkgver=2.2.3
pkgrel=5
pkgdesc="Automated Password Generator."
arch=(x86_64)
url="https://github.com/buzo-ffm/$pkgname/"
license=('custom')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buzo-ffm/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f2d4285947500afff32a045c0931d2712e814b8f6c0b9d5fa766c71c4a9e58d7')

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
