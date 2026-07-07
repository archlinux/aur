# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-closure-common-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#cl-}
pkgver=r42.377f827
pkgrel=1
pkgdesc='Shared code for Closure XML and Closure HTML'
arch=('any')
url='https://cxml.common-lisp.dev/'
license=('BSD' 'custom:LLGPL')
depends=('common-lisp' 'cl-asdf' 'cl-trivial-gray-streams' 'cl-babel')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=('git+git://repo.or.cz/closure-common.git' 'LICENSE')
sha256sums=('SKIP'
            'a576d0daafc12603964073f349e188b49e18515e1fbd0c622014e5199759e0c5')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" *.{lisp,asd}
}
