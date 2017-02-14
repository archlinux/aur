# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clx-truetype
pkgver=20160701
pkgrel=1
pkgdesc="Use truetype fonts in common lisp"
arch=('any')
url="http://filonenko-mikhail.github.io/clx-truetype/"
license=('custom:unknown')
source=("git+https://github.com/filonenko-mikhail/clx-truetype.git#commit=c6e10a918d46632324d5863a8ed067a83fc26de8")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

package() {
  cd ${pkgname}
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 doc/$pkgname.{pdf,html} ${pkgdir}/usr/share/doc/$pkgname/
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/${pkgname}.asd .
  ln -s ../source/${pkgname}/${pkgname}-unicode.asd .
}
