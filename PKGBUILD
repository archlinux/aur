# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cl-alexandria
_pkgname=${pkgname#cl-}
pkgver=20170814
pkgrel=2
pkgdesc="A set of common-lisp help functions"
arch=('any')
url="https://common-lisp.net/project/alexandria/"
license=('custom')
source=("git+https://github.com/keithj/alexandria.git#commit=e5c54bc30b0887c237bde2827036d17315f88737")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname%}"
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

package() {
  cd ${_pkgname}
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
  install -d "$pkgdir"/usr/share/common-lisp/source/${_pkgname}
  install -d "$pkgdir"/usr/share/common-lisp/systems
  
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname} *.lisp
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname} *.asd

  cd "$pkgdir"/usr/share/common-lisp/systems
  ln -s ../source/${_pkgname}/${_pkgname}.asd .
  ln -s ../source/${_pkgname}/${_pkgname}.asd $pkgname-unicode.asd
}
