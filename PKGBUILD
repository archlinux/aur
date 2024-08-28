# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Wu Junyu <wu.junyu.aur@outlook.com>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr
# Contributor: Marti Raudsepp <marti@juffo.org>
_base=cython
pkgbase=pypy-${_base}
pkgname=pypy3-cython
pkgver=3.0.11
pkgrel=1
pkgdesc="C-Extensions for PyPy"
arch=(i686 x86_64)
url="https://${_base}.org"
license=(Apache-2.0)
makedepends=(pypy3-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('b9df807c369c725e3e64ca24f9c3bcbec8248581cb325eda3b57c03af65962c213fa0590d5b82a71288e421e868d58fae1332e8a34b56b96d3175bf6bd8b3785')

package_pypy3-cython() {
  depends=(pypy3)

  cd "${srcdir}/${_base}-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1

  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/opt/pypy3/bin" "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"

  sed -i 's|#!.*python|#!/usr/bin/pypy3|' *
  for i in cython cythonize cygdb; do
    mv $i $i-pypy3
  done
}
