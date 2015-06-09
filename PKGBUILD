# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=scmindent-git
pkgver=20140827
pkgrel=1
pkgdesc="External filter program for properly indenting Racket, Scheme and Lisp"
arch=('any')
depends=('racket')
makedepends=('git')
url="https://github.com/ds26gte/scmindent"
license=('unknown')
source=(git+https://github.com/ds26gte/scmindent)
sha256sums=('SKIP')
provides=('lispindent' 'scmindent')
conflicts=('lispindent' 'scmindent')
install=scmindent.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/scmindent/README.md"
  install -Dm 644 history "$pkgdir/usr/share/doc/scmindent/history"

  msg 'Installing...'
  install -Dm 755 lispindent.lisp "$pkgdir/usr/bin/lispindent"
  install -Dm 755 scmindent.rkt "$pkgdir/usr/bin/scmindent"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
