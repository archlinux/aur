# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-ironclad
_pkgname="${pkgname#cl-}"
pkgver=0.57
pkgrel=2
pkgdesc='A cryptographic toolkit written in Common Lisp'
arch=('any')
url='https://github.com/sharplispers/ironclad'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-bordeaux-threads' 'cl-flexi-streams')
makedepends=('git')
checkdepends=('sbcl' 'cl-rt')
_commit='36663e5afb677890702a2e94386ef8fc8b05b5c1'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '55cf92728fbeae1919290ef15c2d265e08b8beb9910845eaeeddb09213e9582e76264e39492648f6f4318b2d27eb16a822a53333a92bed73c7c16d1d2e2b604f')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

check() {
  cd "$pkgname"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$pkgname"

  # library
  install -vd "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -vr benchmark src testing ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
