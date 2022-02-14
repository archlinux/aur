# Maintainer :  Kr1ss "$(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)"


pkgname=fpp
_name=PathPicker

pkgver=0.9.5
pkgrel=1

pkgdesc='TUI that lets you pick paths out of its stdin and run arbitrary commands on them'
arch=('any')
url="https://facebook.github.io/$_name"
license=('MIT')

depends=('python')

source=("$pkgname-$pkgver.tgz::https://github.com/facebook/$_name/archive/$pkgver.tar.gz")
sha256sums=('b0142676ed791085d619d9b3d28d28cab989ffc3b260016766841c70c97c2a52')

options=('zipman')


prepare() { rm -rf "$_name-$pkgver/src/tests"; }

package() {
  cd "$_name-$pkgver"
  # install application
  install -Dm755 "$pkgname" -t"$pkgdir/usr/share/$pkgname/"
  cp -a --no-preserve=o src "$pkgdir/usr/share/$pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/"
  # documentation
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 {README,CONTRIBUTING,CODE_OF_CONDUCT}.md index.html -t"$pkgdir/usr/share/doc/$pkgname/"
  cp -a --no-preserve=o assets "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm755 "debian/usr/share/man/man1/$pkgname.1" -t"$pkgdir/usr/share/man/man1/"
}


# vim: sw=2 ts=2 et ft=PKGBUILD:
