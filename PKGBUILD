# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=fpp
_prjname=PathPicker
pkgver=0.7.2
pkgrel=1

pkgdesc='TUI that lets you pick paths out of its stdin and run arbitrary commands on them'
arch=('any')
url="https://facebook.github.io/$_prjname/"
license=('BSD')

depends=('python')

options=('zipman')

source=("https://github.com/facebook/$_prjname/archive/$pkgver.tar.gz")
sha256sums=('e6376fe627474e3e3109f9f913327098e84887fce67a8d1e7d12835ff04ee620')

prepare() {
  rm -r "$srcdir/$_prjname-$pkgver/src/__tests__"
}

package() {
  cd "$srcdir/$_prjname-$pkgver"

  # install application
  install -Dm755 -t "$pkgdir/usr/share/$pkgname/" "$pkgname"
  cp -R src "$pkgdir/usr/share/$pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE PATENTS
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CONTRIBUTING.md index.html
  cp -R assets "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm755 -t "$pkgdir/usr/share/man/man1/" debian/usr/share/man/man1/fpp.1
}

# vim: sw=2 ts=2 et:
