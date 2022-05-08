# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-bordeaux-threads
_pkgname="${pkgname#cl-}"
pkgver=0.8.8
pkgrel=1
pkgdesc='Portable shared-state concurrency for Common Lisp'
arch=('any')
url='https://sionescu.github.io/bordeaux-threads/'
license=('MIT')
depends=('cl-alexandria') # common-lisp & cl-asdf also...
makedepends=('git')
_commit='076fe2380abbc59b06e495dc7a35aea8eb26ba3b'
source=("$pkgname::git+https://github.com/sionescu/bordeaux-threads#commit=$_commit")
md5sums=('SKIP')

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
    src/*.lisp \
    ./*.asd \
    version.sexp

  # asdf
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README site/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
