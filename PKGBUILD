# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-named-readtables
_pkgname="${pkgname#cl-}"
pkgver=0.9.r47.gd5ff162
pkgrel=1
pkgdesc='Library that creates a namespace for readtables akin to the namespace of packages'
arch=('any')
url='https://github.com/melisgl/named-readtables'
license=('BSD')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-try')
_commit='d5ff162ce02035ec7de1acc9721385f325e928c0'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

#check() {
#  cd "$pkgname"
#
#  sbcl --script ../run-tests.lisp
#}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr src test "$_pkgname.asd" "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
