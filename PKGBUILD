# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgbase="python-simplebayes"
pkgname=("python-simplebayes" "python2-simplebayes")
_pkgname="simplebayes"
pkgver="1.5.7"
pkgrel="2"
pkgdesc="A memory-based, optional-persistence naïve bayesian text classifier."
arch=('i686' 'x86_64')
url="https://github.com/hickeroar/simplebayes"
license=('MIT')
makedepends=('python' 'python2')
changelog="ChangeLog"
source=("${_pkgname}.tar.gz::https://github.com/hickeroar/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('71cb029768bd25c172bdb3bd37174d42f872da92c33329ec736c3748ffa3b4a7')

prepare() {
  cd "$srcdir/"
  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  cd "${_pkgname}-${pkgver}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python2-simplebayes() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

package_python-simplebayes() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
