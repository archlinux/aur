# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cl-alexandria
_pkgname=${pkgname#cl-}
pkgver=20161123
pkgrel=2
pkgdesc="A set of common-lisp help functions"
arch=('any')
url="https://common-lisp.net/project/alexandria/"
license=('custom')
source=("git+https://gitlab.common-lisp.net/alexandria/alexandria.git#commit=85f82ed88d5fa6e63026038dbb1dad0d6cd5dafe")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname%}"
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

package() {
  cd ${_pkgname}
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/${pkgname}.asd .
  ln -s ../source/${pkgname}/${pkgname}-unicode.asd .
}
