# $Id: PKGBUILD,v 1.20 2009/01/26 17:07:33 angvp Exp $
# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.4.0
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
depends=('blas' 'lapack')
makedepends=('python-nose' 'gcc-fortran')
optdepends=('python-nose: test suite')
source=(http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz)
md5sums=('6d0ea698beda38109796240d08ecb296')

build() {
  cd "${srcdir}/numpy-${pkgver}"
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"
  python setup.py config_fc --fcompiler=gnu95 build || return 1
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" || return 1

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
