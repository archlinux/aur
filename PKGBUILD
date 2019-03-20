# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve2
pkgver=2.2
pkgrel=2
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials (version 2)"
url="http://numpi.dm.unipi.it/mpsolve-2.2"
arch=('i686' 'x86_64')
license=('custom')
depends=('gmp')
source=("${url}/mpsolve.tgz")
sha256sums=('2b3ad94d9ba88492fedb7c33c8084aa14e97acb5c90e5a0558ed79ef29c9230f')

build () {
  cd "${srcdir}/MPSolve-${pkgver}"
  make
}

check () {
  cd "${srcdir}/MPSolve-${pkgver}"
  make check
}

package () {
  cd "${srcdir}/MPSolve-${pkgver}"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" Copyright.txt
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" Doc/*
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/Data" Data/*
  sed -i -e 's#\.\./Data/#Data/#' "${pkgdir}/usr/share/doc/${pkgname}"/*.htm
  install -D -m755 unisolve ${pkgdir}/usr/bin/unisolve
}
