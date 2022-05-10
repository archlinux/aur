# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-ironclad
_pkgname="${pkgname#cl-}"
pkgver=0.57
pkgrel=1
pkgdesc='A cryptographic toolkit written in Common Lisp'
arch=('any')
url='https://github.com/sharplispers/ironclad'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-bordeaux-threads' 'cl-flexi-streams')
makedepends=('git' 'sbcl')
checkdepends=() # cl-rt
_commit='36663e5afb677890702a2e94386ef8fc8b05b5c1'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr benchmark src testing ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  ln -s "../source/$_pkgname/$_pkgname-text.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
