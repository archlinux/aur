# Maintainer: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-zpb-ttf
pkgver=1.0.3
pkgrel=1
pkgdesc="Use truetype fonts in common lisp"
arch=('any')
url="http://xach.com/lisp/spb-ttf/"
license=('custom:unknown')
source=("git+https://github.com/xach/zpb-ttf.git#commit=6c791440ea9eae584f3f98caeda0ea011fdde132")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname#cl-}
  echo $(cat zpb-ttf.asd | grep version | sed -e 's/  :version \"\(.*\)\"/\1/')
}

package() {
  cd ${pkgname#cl-}

  # Install documentation
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 doc/index.html ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 doc/lambda.png ${pkgdir}/usr/share/doc/$pkgname/

  # Install source and *.asd files
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  # Link *.asd files appropriately
  install -d ${pkgdir}/usr/share/common-lisp/systems

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/*.asd
}
