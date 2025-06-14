# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=words-insane
pkgver=2020.12.07
pkgrel=2
pkgdesc="really big wordlist based on SCOWL"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('custom:copyright')
makedepends=(coreutils glibc)
source=("https://downloads.sourceforge.net/wordlist/scowl-$pkgver.tar.gz")
b2sums=('b65b984f830a05e05c45c90212d27185a71f83477e0c3d97f4555f2296234ae50c6460903508a7c9d466a0267237de2e6c78901d8b396f83f58cea68086b7dd2')


build() {
  cd "scowl-$pkgver"
  cat final/* > words-insane.8859
  iconv --from-code=ISO-8859-1 --to-code=UTF-8 words-insane.8859 > words-insane.utf8
  LANG=C sort -u words-insane.utf8 > words-insane
}

package() {
  cd "scowl-$pkgver"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/Copyright"
  install -Dm644 words-insane "$pkgdir/usr/share/dict/words-insane"
}

