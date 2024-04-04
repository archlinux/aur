# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Benjamin Wang <w.benji@tuta.io>
# Contributor: Arnold Sommerfeld <mrsommerfeld@pm.me>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Pappa <jcberg@gmail.com >

_distname=python-xlib
pkgname=python2-xlib
pkgver=0.33
pkgrel=2
pkgdesc="A fully functional X client library (for Python 2)"
url="https://github.com/${_distname}/${_distname}"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('python2-six')
makedepends=('python2-setuptools')
source=("${_distname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('ca1d2f998554023dac756f44cb96d6c026e445341e7f3c41176c01cc4c9c158efb9fb030b517e69085180dd9ba033992daa1a1b85c8eb142898e4d3698545596')

prepare() {
  cd "${_distname}-${pkgver}"

  printf "Changing hashbangs in *.py files to refer to 'python2'... "
  sed -e '1s|#![ ]*[a-z0-9._/]*/bin/[a-z0-9._/ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
  echo 'done'

  echo "Removing setuptools_scm makedepend in favor of setuptools..."
  sed -e 's/setuptools-scm/setuptools/' \
      -i setup.py
  echo "Done."
}

build(){
  cd "${_distname}-${pkgver}"
  python2 setup.py build
}

package_python2-xlib() {
  cd "${_distname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
