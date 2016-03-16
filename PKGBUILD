# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve2
pkgver=2.2
pkgrel=1
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials (version 2)"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('i686' 'x86_64')
license=('custom')
depends=('gmp')
source=("http://numpi.dm.unipi.it/mpsolve-2.2/mpsolve.tgz"
        "http://numpi.dm.unipi.it/mpsolve-2.2/copyright.htm")
sha256sums=('2b3ad94d9ba88492fedb7c33c8084aa14e97acb5c90e5a0558ed79ef29c9230f'
            'e8f83c91148adb6eb9a0802652640bfb060d903823cdf76f4c324cc1bb073292')

build () {
  cd ${srcdir}/MPSolve-${pkgver}
  make
}

check () {
  cd ${srcdir}/MPSolve-${pkgver}
  make check
}

package () {
  cd ${srcdir}
  sed -e 's/ background="sfondop.gif"//' -e 's#href="index.htm"#href="http://numpi.dm.unipi.it/mpsolve-2.2/index.htm"#' -i copyright.htm
  install -D -m644 copyright.htm -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd MPSolve-${pkgver}
  install -D -m755 unisolve ${pkgdir}/usr/bin/unisolve
}
