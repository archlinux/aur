# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=tecoc
pkgver=0398
pkgrel=1
pkgdesc="Text Editor and COrrector implementation by Tom Almy"
provides=(teco)
arch=(i686 x86_64)
url="http://almy.us/teco.html"
license=(custom)
depends=(glibc)
source=("http://almy.us/files/${pkgname}linux$pkgver.tar.gz")
sha256sums=('9bc2f550ccec87af768c52138225a439687f41d2a9d2da74e2919983323912ba')

build() {
  cd "$srcdir/$pkgname$pkgver/src"
  PATH=".:$PATH" make
}

package() {
  cd "$srcdir/$pkgname$pkgver"

  install -D src/tecoc "$pkgdir/usr/bin/tecoc"
  ln -s tecoc "$pkgdir/usr/bin/Make"
  ln -s tecoc "$pkgdir/usr/bin/inspect"
  ln -s tecoc "$pkgdir/usr/bin/mung"
  ln -s tecoc "$pkgdir/usr/bin/teco"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  sed '/tomalmy/q' doc/readme.1st > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/* "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
