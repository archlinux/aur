# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=dirsearch

pkgver=0.3.8
pkgrel=1

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

depends=('python')

changelog=CHANGELOG.md
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('af4eec7e963fb410038fba26c0dd8dc9670f9bf43188a4379c879c329446aaa7')

prepare() {
  cd "$pkgname-$pkgver"
  rm .gitignore || :
  rm -r {logs,reports}
  sed -i 's/^#\(save-logs-home.*$\)/\1/' default.conf
}
package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/{bin,{share/doc/,lib/}$pkgname}
  cp -a * "$pkgdir/usr/lib/$pkgname/"
  install -m644 *.md "$pkgdir/usr/share/doc/$pkgname/"
  ln -s /usr/lib/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
