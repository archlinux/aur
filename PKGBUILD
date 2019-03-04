# Maintainer: Tarn W. Burton <twburton@gmail.com>

pkgname=scmindent-git
pkgver=20190127
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
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.adoc "$pkgdir/usr/share/doc/scmindent/README.adoc"
  install -Dm 644 history "$pkgdir/usr/share/doc/scmindent/history"

  msg 'Installing...'
  install -Dm 755 lispindent.lisp "$pkgdir/usr/bin/lispindent"
  install -Dm 755 scmindent.rkt "$pkgdir/usr/bin/scmindent"
}
