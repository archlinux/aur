# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-parse-js
_pkgname="${pkgname#cl-}"
pkgver=r101.gfbadc60
pkgrel=1
pkgdesc='A Javascript parser in Common Lisp'
arch=('any')
url='https://marijnhaverbeke.nl/parse-js/'
license=('zlib')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
_commit='fbadc6029bec7039602abfc06c73bb52970998f6'
source=("$pkgname::git+https://marijnhaverbeke.nl/git/parse-js#commit=$_commit")
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
  cp -vr src as.txt parse-js.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" index.html

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
