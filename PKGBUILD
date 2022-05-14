# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-benchmark
_pkgname="${pkgname#cl-}"
pkgver=2.0.0.r25.g42d7673
pkgrel=1
pkgdesc='Common Lisp library to perform quick benchmark tests'
arch=('any')
url='https://shinmera.github.io/trivial-benchmark'
license=('zlib')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria')
makedepends=('git')
_commit='42d76733dd2e873471c6f1e27d39113293f7dd5c'
source=("$pkgname::git+https://github.com/Shinmera/trivial-benchmark#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgver=2.0.0
  local _pkgcommit='df6bafefecf8d219b7ecfd4d2df14a5adfbb6a06'

  git tag "$_pkgver" "$_pkgcommit"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md about.html

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
