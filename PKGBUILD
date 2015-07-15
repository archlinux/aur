# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=arpack++
pkgver=1.2
pkgrel=3
pkgdesc="an object-oriented version of the ARPACK package"
arch=('any')
url="http://www.ime.unicamp.br/~chico/arpack++/"
license=('BSD')
depends=('glibc' 'arpack' 'lapack' 'blas')
optdepends=('superlu' 'umfpack')
source=(http://www.ime.unicamp.br/~chico/${pkgname}/${pkgname}.tar.gz
        http://reuter.mit.edu/download/arpackpp1.2.patch.diff)
md5sums=('ba746bd46ea53ed2f141c806e36c60b2' '09c778d6fd3815974d4b9ef940c31129')

build()
{
  cd ${srcdir}/${pkgname}

  # patch required for gcc > 4
  #mv $startdir/download?f=arpack%2B%2B1.2.patch.diff ../${pkgname}${pkgver}.patch.diff || return 1
  patch -Np1 -i ../arpackpp${pkgver}.patch.diff || return 1

  # install headers
  install -d ${pkgdir}/usr/include/arpack++
  install include/*.h ${pkgdir}/usr/include/arpack++

  # install docs
  install -d ${pkgdir}/usr/share/doc/arpack++
  install doc/* ${pkgdir}/usr/share/doc/arpack++

  # install tutorials
  install -d ${pkgdir}/usr/share/arpack++/examples
  cp -r examples/* ${pkgdir}/usr/share/arpack++/examples
}
