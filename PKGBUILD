# Maintainer: sanlun <miwa at nc-toyama dot ac dot jp>

pkgname=cl-dbus-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#cl-}
pkgver=r110.8bba6a0
pkgrel=1
pkgdesc='A D-BUS client library for Common Lisp'
arch=('any')
url='https://github.com/death/dbus'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria' 'cl-babel' 'cl-xmlspam' 'cl-flexi-streams'
         'cl-iolib' 'cl-ironclad' 'cl-split-sequence' 'cl-trivial-garbage' 'cl-ieee-floats')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README
  install -d "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -r *.{lisp,asd} examples "$pkgdir/usr/share/common-lisp/source/$_pkgname"
}
