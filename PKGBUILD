# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-gray-streams
_pkgname="${pkgname#cl-}"
pkgver=r70.g2b3823e
pkgrel=1
pkgdesc='Compatibility layer for Gray Streams'
arch=('any')
url='https://trivial-gray-streams.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
_commit='2b3823edbc78a450db4891fd2b566ca0316a7876'
source=("$pkgname::git+https://github.com/trivial-gray-streams/trivial-gray-streams#commit=$_commit")
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
  cp -vr test ./*.{lisp,asd} "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  ln -s "../source/$_pkgname/$_pkgname-test.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
