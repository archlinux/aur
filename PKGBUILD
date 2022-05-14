# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-closer-mop
_pkgname="${pkgname#cl-}"
pkgver=1.0.0.r166.g701b637
pkgrel=1
pkgdesc='A compatibility layer that rectifies erroneous CLOS MOP features across Common Lisp implementations'
arch=('any')
url='https://github.com/pcostanza/closer-mop'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
_commit='701b637b7f061c2137f2697df71ef998590479e7'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd,txt,cl}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
