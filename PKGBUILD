# Maintainer :  Kr1ss "$(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)"

pkgname=fpp
_prjname=PathPicker
pkgver=0.9.2
pkgrel=1

pkgdesc='TUI that lets you pick paths out of its stdin and run arbitrary commands on them'
arch=('any')
url="https://facebook.github.io/$_prjname/"
license=('MIT')

depends=('python')

options=('zipman')

source=("https://github.com/facebook/$_prjname/archive/$pkgver.tar.gz")
sha256sums=('4b3deac0100fb9405adca17a1c75e133359a6cbb1351c392276a55ef8ef40857')

prepare() {
  rm -rf "$srcdir/$_prjname-$pkgver/src/__tests__"
}

package() {
  cd "$srcdir/$_prjname-$pkgver"

  # install application
  install -Dm755 -t "$pkgdir/usr/share/$pkgname/" "$pkgname"
  cp -a src "$pkgdir/usr/share/$pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {README,CONTRIBUTING,CODE_OF_CONDUCT}.md index.html
  cp -a assets "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm755 -t "$pkgdir/usr/share/man/man1/" debian/usr/share/man/man1/fpp.1
}

# vim: sw=2 ts=2 et:
