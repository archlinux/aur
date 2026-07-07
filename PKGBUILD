# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-cxml-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#cl-}
pkgver=r231.9365c4b
pkgrel=1
pkgdesc="Closure XML parser, written in Common Lisp"
arch=('any')
url="https://cxml.common-lisp.dev"
license=('custom:LLGPL')
depends=('common-lisp' 'cl-asdf' 'cl-closure-common' 'cl-puri' 'cl-trivial-gray-streams')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=('git+git://repo.or.cz/cxml.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/* README OLDNEWS
  install -d "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -r *.{asd,dtd,diff} dom klacks test xml contrib DOMTEST TIMES XMLCONF \
     "$pkgdir/usr/share/common-lisp/source/$_pkgname"
}
