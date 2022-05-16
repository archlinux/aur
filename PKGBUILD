# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-javascript
_pkgname=cl-js
pkgver=0.12.03.r29.g5ffa5e9
pkgrel=1
pkgdesc='Javascript compiler for Common Lisp (a.k.a. cl-js)'
arch=('any')
url='https://marijnhaverbeke.nl/cl-javascript/'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-parse-js' 'cl-ppcre' 'cl-local-time')
makedepends=('git')
checkdepends=()
_commit='5ffa5e9d113f2000bbbdccda634f09e272b1983d'
source=("$pkgname::git+https://github.com/akapav/js#commit=$_commit")
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
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    ./*.{lisp,asd}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md index.html

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
