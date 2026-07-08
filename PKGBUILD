# Maintainer: sanlun <miwa at nc-toyama dot ac dot jp>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-ironclad
_pkgname="${pkgname#cl-}"
pkgver=0.61
pkgrel=1
pkgdesc='A cryptographic toolkit written in Common Lisp'
arch=('any')
url='https://github.com/sharplispers/ironclad'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-bordeaux-threads' 'cl-flexi-streams')
checkdepends=('sbcl' 'cl-rt')
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  'run-tests.lisp'
)
sha256sums=('a16a3fb7a58a48843914ed8dcbcaeb3131548e4fa7c6c64f1ebbe858621869a6'
            '3109b458d721bdcd42b79fc22fa53a9e968ecbeb5675296b85a639df40978599')

check() {
  cd "$_pkgname-$pkgver"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$_pkgname-$pkgver"

  # library
  install -vd "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -vr benchmark src testing ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
