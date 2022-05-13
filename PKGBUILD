# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-fiveam
_pkgname="${pkgname#cl-}"
pkgver=1.4.2.r12.ge11dee7
pkgrel=1
pkgdesc='A regression testing framework for Common Lisp'
arch=('any')
url='https://fiveam.common-lisp.dev'
license=('MIT')
depends=(
  'cl-asdf'
  'common-lisp'
  'cl-alexandria'
  'cl-asdf-flv'
  'cl-trivial-backtrace'
)
makedepends=('git' 'sbcl')
_commit='e11dee752a8f59065033ef9d60641d4a2f1e8379'
source=("$pkgname::git+https://github.com/lispci/fiveam#commit=$_commit")
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
  cp -vr \
    src t \
    fiveam.asd version.sexp \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
