# Maintainer: sanlun <miwa at nc-toyama dot ac dot jp>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-split-sequence
_pkgname="${pkgname#cl-}"
pkgver=2.0.1
pkgrel=2
pkgdesc='Splits a sequence into a list of subsequences'
arch=('any')
url='https://github.com/sharplispers/split-sequence'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
checkdepends=('sbcl' 'cl-fiveam')
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  'run-tests.lisp'
)
sha256sums=('e5d0efe5bebc9566ad9f84f2c247fc5f6e5bd06e05ac0127b04654da8a7da59b'
            '9e703c879f1ae47524ad791dbd8c1dfc01cc5d8cc0cf257195c9f30bcc638e1f')

check() {
  cd "$_pkgname-$pkgver"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$_pkgname-$pkgver"

  # create directories
  install -vd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd,sexp}

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md original-message.txt

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
