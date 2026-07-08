# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-ieee-floats
_pkgname="${pkgname#cl-}"
pkgver=r27.9566ce8
pkgrel=1
pkgdesc='IEEE-754 implementation for Common Lisp'
arch=('any')
url='https://ieee-floats.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='9566ce8adfb299faef803d95736c780413a1373c'
source=(
  "$pkgname::git+https://github.com/marijnh/ieee-floats#commit=$_commit"
  'run-tests.lisp'
)
sha256sums=('56ae89ef399d8f0ab21d9bd405d70184da08a7f711aed47939056b8a09362312'
            '264f74758ac3ca9f5b7539b0d3ecbd9a71b2dadea05d1b18ca6a0675d70b2620')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$pkgname"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
