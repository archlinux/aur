# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-qtpy
_pkgname='qtpy'
pkgver=1.9.0
pkgrel=1
pkgdesc='Provides an uniform layer to support PyQt5, PyQt4 and PySide with a single codebase'
arch=('any')
url="https://github.com/spyder-ide/${_pkgname}/"
license=('MIT')
source=("python-${_pkgname}-${pkgver}.tar.gz"::"https://github.com/spyder-ide/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a6783acab8f7f7b04026c7da19c65bf904d69629d06d951cb7b9344468270c5b')
makedepends=('python2' 'python2-setuptools')
depends=('python2')
optdepends=('python2-pyqt5: Qt5 Python bindings'
            'python2-pyqtwebengine: Qt5-WebEngine python bindings')

prepare() {
  # Fix Python 2.x shebang
  cd "${_pkgname}-${pkgver}"
  sed -i 's@^#!.*python$@#!/usr/bin/env python2@' "${_pkgname}/tests/runtests.py"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license file
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

