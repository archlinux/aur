# Maintainer: Julian DeMille <jtdemille@demilletech.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jimmy Aguilar <spacibba@aol.com>

pkgname=cl-alexandria-git
_pkgname=${pkgname#cl-}
_pkgname=${_pkgname%-git}
pkgver=r261.521e9a0
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A set of common-lisp help functions"
arch=('any')
url="https://common-lisp.net/project/alexandria/"
license=('custom')
source=('git+https://gitlab.common-lisp.net/alexandria/alexandria.git')
md5sums=('SKIP')
conflicts=('cl-alexandria')
provides=('cl-alexandria')

package() {
  cd ${_pkgname}
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
  install -d "$pkgdir"/usr/share/common-lisp/source/${_pkgname}
  install -d "$pkgdir"/usr/share/common-lisp/source/${_pkgname}/${_pkgname}-1
  install -d "$pkgdir"/usr/share/common-lisp/source/${_pkgname}/${_pkgname}-2
  install -d "$pkgdir"/usr/share/common-lisp/systems
  
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname}/${_pkgname}-1 ${_pkgname}-1/*.lisp
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname}/${_pkgname}-2 ${_pkgname}-2/*.lisp
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname} *.asd

  cd "$pkgdir"/usr/share/common-lisp/systems
  ln -s ../source/${_pkgname}/${_pkgname}.asd .
  ln -s ../source/${_pkgname}/${_pkgname}.asd $pkgname-unicode.asd
}
