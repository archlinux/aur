# $Id: PKGBUILD,v 1.20 2009/01/26 17:07:33 angvp Exp $
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.3.0
pkgrel=2
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
depends=('blas' 'lapack')
makedepends=('python-nose')
optdepends=('python-nose: test suite')
source=(http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz)
md5sums=('3f7773ff0971a5ebb8591536d8ec7bd6')

build() {
  cd "${srcdir}/numpy-${pkgver}"
  export Atlas=None
  python setup.py config_fc --fcompiler=gnu95 build || return 1
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" || return 1

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
