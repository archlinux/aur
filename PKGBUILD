# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-pythonic-string-reader
_pkgname="${pkgname#cl-}"
pkgver=r8.g47a70ba
pkgrel=1
pkgdesc='A simple read table modification inspired by Python three quote strings'
arch=('any')
url='https://github.com/smithzvk/pythonic-string-reader'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-named-readtables')
makedepends=('git')
_commit='47a70ba1e32362e03dad6ef8e6f36180b560f86a'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
