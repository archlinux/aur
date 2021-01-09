# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

_pkgver=0.4.1-alpha
pkgver="${_pkgver/-/.}"
pkgrel=2

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
backup=("usr/lib/$pkgname/default.conf")
source=("$pkgname-$_pkgver.tgz::$url/archive/v${_pkgver}.tar.gz")
b2sums=('04aa83d8c1acf7d7f093820af944dd63e2508678ae2311bae8393e6b8dc4e3fa15b766dea9a2b320029d8c7143d9f7caf7bf02f1abf4bb248fb0428a4f730fab')


prepare() {
  cd "$pkgname-$_pkgver"
  sed -i 's/^\(save-logs-home\s*=\s*\)False/\1True/' default.conf
}

package() {
  cd "$pkgname-$_pkgver"
  install -dm755 "$pkgdir/usr"/{bin,"lib/$pkgname"}
  cp -a --no-preserve=o db lib thirdparty default.conf dirsearch.py "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
  ln -s /usr/lib/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
