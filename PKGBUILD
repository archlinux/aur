# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Rebischke <chris dot rebischke[at]archlinux[dot]org>

_name=PyPDNS
pkgbase=python-pypdns
pkgname=('python-pypdns' 'python2-pypdns')
pkgver=1.4.1
pkgrel=1
pkgdesc="Python API for PDNS."
arch=('any')
url="https://github.com/CIRCL/PyPDNS"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://github.com/CIRCL/PyPDNS/archive/v${pkgver}.tar.gz")
sha512sums=('b409bf4e44a9cdd439b7f5e1097fab8741adb1e346d5ae701037821c79ee619286841d212ad1876eff932e6c4ace7d53dee506a2a3fe6bf4e4334e3f444725a9')

prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-py2}

  cd "${srcdir}/${_name}-${pkgver}-py2"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find . -name '*.py')
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py build
}

package_python2-pypdns() {
  depends=('python2')

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

package_python-pypdns() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set et sw=2 ts=2 tw=79:
