# Maintainer: Adelmo Junior <noblehelm@gmail.com>
# Done while using both community:python-scikit-learn and AUR:python-keras as base, so credit goes to them
# If anything done wrong, please contact me

pkgbase="python-scikit-fuzzy"
pkgname=("python-scikit-fuzzy")
_pkgname="scikit-fuzzy"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="A fuzzy logic toolkit for SciPy"
arch=('any')
url="https://github.com/scikit-fuzzy/scikit-fuzzy"
license=('custom')
makedepends=('python' 'python-setuptools' 'python-numpy' 'python-scipy' 'python-networkx')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4041e16b0e19a171bae3e830703e55fe17c35d41d81acd0457826b5112e9df3')

prepare() {
  cd "$srcdir"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-py2-${pkgver}"
  cd "${_pkgname}-${pkgver}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-scikit-fuzzy() {
  depends=('python' 'python-numpy' 'python-scipy' 'python-networkx')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
