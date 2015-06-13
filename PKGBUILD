# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=words-insane
pkgver=7.1
pkgrel=1
pkgdesc="A really big wordlist with 670k entries, based on SCOWL."
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('custom:copyright')
source=(http://downloads.sourceforge.net/wordlist/scowl-$pkgver.tar.gz)
md5sums=('49f3ad788f94c8c0008398f5d284771b')

build() {
  cd "$srcdir/scowl-$pkgver"
  cat final/* > words-insane.8859
  iconv --from-code=ISO-8859-1 --to-code=UTF-8 words-insane.8859 > words-insane.utf8
  LANG=C sort -u words-insane.utf8 > words-insane
}

package() {
  cd "$srcdir/scowl-$pkgver"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  install -Dm644 words-insane "$pkgdir/usr/share/dict/words-insane"
}

